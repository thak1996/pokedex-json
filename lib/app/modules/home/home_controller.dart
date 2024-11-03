import 'package:flutter/material.dart';
import 'package:integration/app/core/services/pokemon_service.dart';

class HomeController extends ChangeNotifier {
  final PokemonService _pokeService;
  List<dynamic>? pokemons;
  String? errorMessage;
  bool isLoading = false;

  HomeController(this._pokeService);

  Future<void> fetchPokemons({int limit = 20, int offset = 0}) async {
    isLoading = true;
    notifyListeners();

    final result = await _pokeService.getPokemons();

    result.fold(
      (failure) {
        errorMessage = failure.message; // Captura a mensagem de erro
        pokemons = null; // Limpa os dados
      },
      (data) {
        pokemons = data.results; // Armazena os dados
        errorMessage = null; // Limpa a mensagem de erro
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
