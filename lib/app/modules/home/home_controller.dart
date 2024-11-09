import 'package:flutter/material.dart';
import '../../core/data/exceptions.dart';
import '../../core/models/pokemon_model.dart';
import '../../core/models/pokemon_type.dart';
import '../../core/services/pokemon_service.dart';
import '../../core/theme/theme_controller.dart';
import 'home_state.dart';

enum SortType { numeric, alphabetic }

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
  late SortType _currentSortType;
  List<Pokemon> _filteredPokemons = [];
  HomeState _state = HomeInitialState();

  @override
  void dispose() {
    _allPokemons.clear();
    _filteredPokemons.clear();
    super.dispose();
  }

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  bool _matchesPokemonCriteria(Pokemon pokemon, String searchTerm) {
    return pokemon.name.toLowerCase().contains(searchTerm) ||
        pokemon.id.toString().contains(searchTerm) ||
        pokemon.type.any((type) => type.toLowerCase().contains(searchTerm));
  }

  void _sortPokemons() {
    final comparator = _currentSortType == SortType.numeric
        ? (Pokemon a, Pokemon b) => a.id.compareTo(b.id)
        : (Pokemon a, Pokemon b) => a.name.compareTo(b.name);
    _filteredPokemons = List.from(_filteredPokemons)..sort(comparator);
    _allPokemons = List.from(_allPokemons)..sort(comparator);
  }

  SortType get currentSortType => _currentSortType;
  List<Pokemon> get pokemons => List.unmodifiable(_filteredPokemons);
  HomeState get state => _state;
  ThemeController get themeController => _themeController;

  void clearSearch() {
    _filteredPokemons = List.from(_allPokemons);
    _changeState(HomeSuccessState(_filteredPokemons));
  }

  Future<void> fetchPokemons() async {
    if (_state is HomeLoadingState) return;
    _changeState(HomeLoadingState());
    try {
      final result = await _pokemonService.getPokemons();
      result.fold(
        (failure) => _changeState(HomeErrorState(failure.message)),
        (data) {
          if (data.pokemon.isEmpty) {
            _changeState(HomeEmptyState('No Pokemons available'));
            return;
          }
          _allPokemons = List.from(data.pokemon);
          _filteredPokemons = List.from(_allPokemons);
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
      clearSearch();
      return;
    }
    final searchLower = query.toLowerCase();
    final filteredList = _allPokemons.where((pokemon) {
      return _matchesPokemonCriteria(pokemon, searchLower);
    }).toList();
    _filteredPokemons = filteredList;
    if (_filteredPokemons.isEmpty) {
      _changeState(HomeEmptyState('Pokemon not found.'));
    } else {
      _changeState(HomeSuccessState(_filteredPokemons));
    }
  }

  void toggleSortType(SortType newType) {
    if (_currentSortType == newType) return;
    _currentSortType = newType;
    _sortPokemons();
    _changeState(HomeSuccessState(_filteredPokemons));
  }
}
