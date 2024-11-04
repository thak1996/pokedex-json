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

  HomeState _state = const HomeInitialState();

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  List<Pokemon> get pokemons => (_state as HomeSuccessState<Pokemon>).data;
  HomeState get state => _state;
  ThemeController get themeController => _themeController;

  Future<void> fetchPokemons() async {
    _changeState(const HomeLoadingState());
    final result = await _pokemonService.getPokemons();
    result.fold(
      (failure) => _changeState(HomeErrorState(failure.message)),
      (data) => _changeState(HomeSuccessState(data.pokemon)),
    );
  }

  Color getCardBackgroundColor(String type) => PokemonTypeInfo.getColor(type);
}
