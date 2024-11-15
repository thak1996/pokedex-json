import 'package:flutter/material.dart';
import '../../core/models/pokemon_model.dart';
import '../../core/models/pokemon_type.dart';
import '../../core/services/pokemon_service.dart';
import 'details_state.dart';

class DetailsController extends ChangeNotifier {
  DetailsController(this._pokemonService);

  final PokemonService _pokemonService;

  DetailsState _state = DetailsInitialState();

  void _changeState(DetailsState newState) {
    _state = newState;
    notifyListeners();
  }

  Pokemon get pokemon => (_state as DetailsSuccessState).pokemon;
  DetailsState get state => _state;

  Color getCardBackgroundColor(String type) => PokemonTypeInfo.getColor(type);

  void loadDetails(int pokemonId) async {
    _changeState(DetailsLoadingState());
    final result = await _pokemonService.getPokemonById(pokemonId);
    result.fold(
      (failure) => _changeState(DetailsErrorState(failure.message)),
      (data) => _changeState(DetailsSuccessState(data)),
    );
  }
}
