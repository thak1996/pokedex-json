import 'package:flutter/material.dart';
import 'package:integration/app/core/service/poke_service.dart';

class HomeController extends ChangeNotifier {
  final PokeService _pokeService;

  HomeController(this._pokeService);

  Future<void> loadPokemons() async {
    try {
      final pokemons = await _pokeService.fetchPokemons();
      // Faça algo com a lista de Pokémon
    } catch (e) {
      // Trate o erro
    }
  }
}
