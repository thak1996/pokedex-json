import 'dart:developer';
import 'package:integration/app/core/data/data_result.dart';
import 'package:integration/app/core/data/exceptions.dart';
import 'package:integration/app/core/models/pokemon_model.dart';
import 'package:integration/app/core/services/http_service.dart';

class PokemonService {
  final HttpService _httpService;

  PokemonService()
      : _httpService = HttpService(
            baseUrl:
                'https://raw.githubusercontent.com/thak1996/PokemonGO-Pokedex/master');

  Future<DataResult<PokemonResponse>> getPokemons() async {
    final result = await _httpService.get('/pokedex.json');
    return result.fold(
      (failure) => DataResult.failure(failure),
      (data) {
        try {
          final pokemonResponse = PokemonResponse.fromJson(data);
          return DataResult.success(pokemonResponse);
        } catch (e) {
          log('Error: $e');
          return DataResult.failure(
            const APIException(
              code: 500,
              textCode: 'Erro ao processar dados dos Pokémon',
            ),
          );
        }
      },
    );
  }
}
