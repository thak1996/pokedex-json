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

class Pokemon {
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      num: json['num'] as String,
      name: json['name'] as String,
      img: json['img'] as String,
      type: List<String>.from(json['type']),
      height: json['height'] as String,
      weight: json['weight'] as String,
      candy: json['candy'] as String,
      candyCount: json['candy_count'] as int?,
      egg: json['egg'] as String,
      spawnChance: (json['spawn_chance'] as dynamic).toDouble(),
      avgSpawns: (json['avg_spawns'] as dynamic).toDouble(),
      spawnTime: json['spawn_time'] as String,
      multipliers: json['multipliers'] != null
          ? List<double>.from(
              json['multipliers'].map((x) => (x as dynamic).toDouble()))
          : null,
      weaknesses: List<String>.from(json['weaknesses']),
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
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    this.multipliers,
    required this.weaknesses,
    this.prevEvolution,
    this.nextEvolution,
  });

  final double avgSpawns;
  final String candy;
  final int? candyCount;
  final String egg;
  final String height;
  final int id;
  final String img;
  final List<double>? multipliers;
  final String name;
  final List<Evolution>? nextEvolution;
  final String num;
  final List<Evolution>? prevEvolution;
  final double spawnChance;
  final String spawnTime;
  final List<String> type;
  final List<String> weaknesses;
  final String weight;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'candy_count': candyCount,
      'egg': egg,
      'spawn_chance': spawnChance,
      'avg_spawns': avgSpawns,
      'spawn_time': spawnTime,
      'multipliers': multipliers,
      'weaknesses': weaknesses,
      'prev_evolution': prevEvolution?.map((e) => e.toJson()).toList(),
      'next_evolution': nextEvolution?.map((e) => e.toJson()).toList(),
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
