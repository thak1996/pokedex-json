class Evolution {
  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      num: json['num'] as String,
      name: json['name'] as String,
    );
  }

  const Evolution({
    required this.num,
    required this.name,
  });

  final String name;
  final String num;

  Map<String, dynamic> toJson() {
    return {
      'num': num,
      'name': name,
    };
  }
}

class Stats {
  Stats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      hp: json['hp'] as int,
      attack: json['attack'] as int,
      defense: json['defense'] as int,
      specialAttack: json['special_attack'] as int,
      specialDefense: json['special_defense'] as int,
      speed: json['speed'] as int,
    );
  }

  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  Map<String, dynamic> toJson() {
    return {
      'hp': hp,
      'attack': attack,
      'defense': defense,
      'special_attack': specialAttack,
      'special_defense': specialDefense,
      'speed': speed,
    };
  }
}

class Pokemon {
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      num: json['num'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      img: json['img'] as String,
      type: List<String>.from(json['type']),
      height: json['height'] as String,
      weight: json['weight'] as String,
      candy: json['candy'] as String,
      egg: json['egg'] as String,
      spawnChance: (json['spawn_chance'] as dynamic).toDouble(),
      avgSpawns: (json['avg_spawns'] as dynamic).toDouble(),
      spawnTime: json['spawn_time'] as String,
      multipliers: json['multipliers'] != null
          ? List<double>.from(
              json['multipliers'].map((x) => (x as dynamic).toDouble()))
          : null,
      weaknesses: List<String>.from(json['weaknesses']),
      stats: Stats.fromJson(json['stats']),
      prevEvolution: json['prev_evolution'] != null
          ? List<Evolution>.from(
              json['prev_evolution'].map((x) => Evolution.fromJson(x)))
          : null,
      nextEvolution: json['next_evolution'] != null
          ? List<Evolution>.from(
              json['next_evolution'].map((x) => Evolution.fromJson(x)))
          : null,
    );
  }

  const Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.description,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    this.multipliers,
    required this.weaknesses,
    this.prevEvolution,
    this.nextEvolution,
    required this.stats,
  });

  final int id;
  final String num;
  final String name;
  final String description;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final String egg;
  final double spawnChance;
  final double avgSpawns;
  final String spawnTime;
  final List<double>? multipliers;
  final List<String> weaknesses;
  final List<Evolution>? prevEvolution;
  final List<Evolution>? nextEvolution;
  final Stats stats;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'num': num,
      'name': name,
      'description': description,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'egg': egg,
      'spawn_chance': spawnChance,
      'avg_spawns': avgSpawns,
      'spawn_time': spawnTime,
      'multipliers': multipliers,
      'weaknesses': weaknesses,
      'prev_evolution': prevEvolution?.map((e) => e.toJson()).toList(),
      'next_evolution': nextEvolution?.map((e) => e.toJson()).toList(),
      'stats': stats.toJson(),
    };
  }
}

class PokemonResponse {
  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    final pokemonList = (json['pokemon'] as List)
        .map((pokemon) => Pokemon.fromJson(pokemon))
        .toList();
    return PokemonResponse(pokemon: pokemonList);
  }

  const PokemonResponse({required this.pokemon});

  final List<Pokemon> pokemon;

  Map<String, dynamic> toJson() {
    return {
      'pokemon': pokemon.map((pokemon) => pokemon.toJson()).toList(),
    };
  }
}
