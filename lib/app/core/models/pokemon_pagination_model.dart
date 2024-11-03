import 'package:integration/app/core/models/pokemon_model.dart';

class PokemonPaginationModel {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonModel> results;

  PokemonPaginationModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonPaginationModel.fromJson(Map<String, dynamic> json) {
    return PokemonPaginationModel(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((pokemon) => PokemonModel.fromJson(pokemon))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((pokemon) => pokemon.toJson()).toList(),
    };
  }
}
