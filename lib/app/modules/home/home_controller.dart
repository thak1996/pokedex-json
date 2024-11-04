import 'package:flutter/material.dart';
import 'package:integration/app/core/models/pokemon_model.dart';
import 'package:integration/app/core/services/pokemon_service.dart';
import 'home_state.dart';

class HomeController extends ChangeNotifier {
  HomeController(this._pokeService);

  final PokemonService _pokeService;
  HomeState _state = const HomeInitialState();

  HomeState get state => _state;

  List<Pokemon>? get pokemons =>
      _state is HomeSuccessState ? (_state as HomeSuccessState).pokemons : null;

  Future<void> fetchPokemons() async {
    _changeState(const HomeLoadingState());
    final result = await _pokeService.getPokemons();
    result.fold(
      (failure) => _changeState(HomeErrorState(failure.message)),
      (data) => _changeState(HomeSuccessState(data.pokemon)),
    );
  }

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }
}
