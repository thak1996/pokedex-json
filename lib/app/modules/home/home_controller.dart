import 'package:flutter/material.dart';
import 'package:integration/app/core/services/pokemon_service.dart';
import 'home_state.dart';

class HomeController extends ChangeNotifier {
  HomeController(this._pokeService);

  final PokemonService _pokeService;
  HomeState _state = const HomeInitialState();

  HomeState get state => _state;

  List<dynamic>? get pokemons =>
      _state is HomeSuccessState ? (_state as HomeSuccessState).pokemons : null;

  Future<void> fetchPokemons({int limit = 20, int offset = 0}) async {
    _changeState(const HomeLoadingState());

    final result = await _pokeService.getPokemons();

    result.fold(
      (failure) => _changeState(HomeErrorState(failure.message)),
      (data) => _changeState(HomeSuccessState(data.results)),
    );
  }

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }
}
