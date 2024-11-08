import 'package:flutter/material.dart';
import '../../core/data/exceptions.dart';
import '../../core/models/pokemon_model.dart';
import '../../core/models/pokemon_type.dart';
import '../../core/services/pokemon_service.dart';
import '../../core/theme/theme_controller.dart';
import 'home_state.dart';

enum SortType {
  numeric,
  alphabetic,
}

class HomeController extends ChangeNotifier {
  HomeController._(this._pokemonService, this._themeController);

  factory HomeController(
    PokemonService pokemonService,
    ThemeController themeController,
  ) {
    final controller = HomeController._(pokemonService, themeController);
    controller._currentSortType = SortType.numeric;
    controller.fetchPokemons();
    return controller;
  }

  final PokemonService _pokemonService;
  final ThemeController _themeController;

  List<Pokemon> _allPokemons = [];
  List<Pokemon> _filteredPokemons = [];
  late SortType _currentSortType;
  HomeState _state = HomeInitialState();

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  void _sortPokemons() {
    switch (_currentSortType) {
      case SortType.numeric:
        _filteredPokemons.sort((a, b) => a.id.compareTo(b.id));
        _allPokemons.sort((a, b) => a.id.compareTo(b.id));
      case SortType.alphabetic:
        _filteredPokemons.sort((a, b) => a.name.compareTo(b.name));
        _allPokemons.sort((a, b) => a.name.compareTo(b.name));
    }
  }

  SortType get currentSortType => _currentSortType;
  List<Pokemon> get pokemons => _filteredPokemons;

  HomeState get state => _state;
  ThemeController get themeController => _themeController;

  void clearSearch() {
    _filteredPokemons = _allPokemons;
    _changeState(HomeSuccessState(_filteredPokemons));
  }

  Future<void> fetchPokemons() async {
    _changeState(HomeLoadingState());
    try {
      final result = await _pokemonService.getPokemons();
      result.fold(
        (failure) => _changeState(HomeErrorState(failure.message)),
        (data) {
          _allPokemons = data.pokemon;
          _filteredPokemons = _allPokemons;
          _sortPokemons();
          _changeState(HomeSuccessState(_filteredPokemons));
        },
      );
    } catch (e) {
      _changeState(HomeErrorState(const APIException(code: 500).message));
    }
  }

  Color getCardBackgroundColor(String type) => PokemonTypeInfo.getColor(type);

  void searchPokemon(String query) {
    if (query.isEmpty) {
      _filteredPokemons = _allPokemons;
      _changeState(HomeSuccessState(_filteredPokemons));
      return;
    }
    _filteredPokemons = _allPokemons.where((pokemon) {
      final name = pokemon.name.toLowerCase();
      final searchLower = query.toLowerCase();
      final number = pokemon.id.toString();
      return name.contains(searchLower) ||
          number.contains(searchLower) ||
          pokemon.type.any((type) {
            return type.toLowerCase().contains(searchLower);
          });
    }).toList();

    if (_filteredPokemons.isEmpty) {
      _changeState(HomeEmptyState('Pokemon não encontrado'));
    } else {
      _changeState(HomeSuccessState(_filteredPokemons));
    }
  }

  void toggleSortType(SortType newType) {
    _currentSortType = newType;
    _sortPokemons();
    notifyListeners();
  }
}
