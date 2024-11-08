import 'package:flutter/material.dart';
import 'package:integration/app/core/models/pokemon_type.dart';
import 'package:integration/app/core/theme/theme_controller.dart';
import '../../core/models/pokemon_model.dart';
import '../../core/services/pokemon_service.dart';
import 'home_state.dart';

class HomeController extends ChangeNotifier {
  HomeController._(this._pokemonService, this._themeController);

  factory HomeController(
    PokemonService pokemonService,
    ThemeController themeController,
  ) {
    final controller = HomeController._(pokemonService, themeController);
    controller.fetchPokemons();
    return controller;
  }

  final PokemonService _pokemonService;
  final ThemeController _themeController;

  HomeState _state = HomeInitialState();
  List<Pokemon> _allPokemons = [];
  List<Pokemon> _filteredPokemons = [];

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  List<Pokemon> get pokemons =>
      _state is HomeSuccessState<Pokemon> ? _filteredPokemons : [];
  HomeState get state => _state;
  ThemeController get themeController => _themeController;

  Future<void> fetchPokemons() async {
    _changeState(HomeLoadingState());
    final result = await _pokemonService.getPokemons();
    result.fold(
      (failure) => _changeState(HomeErrorState(failure.message)),
      (data) {
        _allPokemons = data.pokemon;
        _filteredPokemons = _allPokemons;
        _changeState(HomeSuccessState(_filteredPokemons));
      },
    );
  }

  void searchPokemon(String query) {
    if (_state is! HomeSuccessState<Pokemon>) return;

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

  void clearSearch() {
    _filteredPokemons = _allPokemons;
    _changeState(HomeSuccessState(_filteredPokemons));
  }

  Color getCardBackgroundColor(String type) => PokemonTypeInfo.getColor(type);
}
