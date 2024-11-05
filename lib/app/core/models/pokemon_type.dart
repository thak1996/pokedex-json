import 'dart:developer';
import 'package:flutter/material.dart';

import '../theme/app_styles.dart';

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
  dark,
  fairy,
  steel,
}

class PokemonTypeInfo {
  final String type;
  final Color color;

  PokemonTypeInfo(this.type, this.color);

  // Mapa de tipos para cores
  static final Map<PokemonType, Color> typeColors = {
    PokemonType.bug: AppStyles.pokeColorBug,
    PokemonType.dark: AppStyles.pokeColorDark,
    PokemonType.dragon: AppStyles.pokeColorDragon,
    PokemonType.electric: AppStyles.pokeColorElectric,
    PokemonType.fairy: AppStyles.pokeColorFairy,
    PokemonType.fighting: AppStyles.pokeColorFighting,
    PokemonType.fire: AppStyles.pokeColorFire,
    PokemonType.flying: AppStyles.pokeColorFlying,
    PokemonType.ghost: AppStyles.pokeColorGhost,
    PokemonType.normal: AppStyles.pokeColorNormal,
    PokemonType.grass: AppStyles.pokeColorGrass,
    PokemonType.ground: AppStyles.pokeColorGround,
    PokemonType.ice: AppStyles.pokeColorIce,
    PokemonType.poison: AppStyles.pokeColorPoison,
    PokemonType.psychic: AppStyles.pokeColorPsychic,
    PokemonType.rock: AppStyles.pokeColorRock,
    PokemonType.steel: AppStyles.pokeColorSteel,
    PokemonType.water: AppStyles.pokeColorWater,
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
