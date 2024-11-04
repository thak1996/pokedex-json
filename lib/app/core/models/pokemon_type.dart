import 'dart:developer';
import 'package:flutter/material.dart';

enum PokemonType {
  grass,
  poison,
  fire,
  flying,
  water,
  bug,
  normal,
  electric,
  ground,
  fighting,
  psychic,
  rock,
  ice,
  ghost,
  dragon,
}

class PokemonTypeInfo {
  final String type;
  final Color color;

  PokemonTypeInfo(this.type, this.color);

  // Mapa de tipos para cores
  static final Map<PokemonType, Color> typeColors = {
    PokemonType.grass: Colors.green,
    PokemonType.poison: Colors.purple,
    PokemonType.fire: Colors.red,
    PokemonType.flying: Colors.blue,
    PokemonType.water: Colors.blue,
    PokemonType.bug: Colors.green,
    PokemonType.normal: Colors.grey,
    PokemonType.electric: Colors.yellow,
    PokemonType.ground: Colors.brown,
    PokemonType.fighting: Colors.red,
    PokemonType.psychic: Colors.pink,
    PokemonType.rock: Colors.grey[800]!,
    PokemonType.ice: Colors.blue,
    PokemonType.ghost: Colors.purple,
    PokemonType.dragon: Colors.indigo,
  };

  // Método para obter a cor com base no tipo
  static Color getColor(String type) {
    try {
      final pokemonType = PokemonType.values.firstWhere(
        (element) => element.name.toLowerCase() == type.toLowerCase(),
      );
      return typeColors[pokemonType] ?? Colors.white;
    } catch (e) {
      return Colors.white;
    }
  }

  static void printUniqueTypes(List<PokemonType> types) {
    final uniqueTypes = <PokemonType>{};

    for (var type in types) {
      uniqueTypes.add(type);
    }

    for (var type in uniqueTypes) {
      log(type.toString());
    }
  }
}
