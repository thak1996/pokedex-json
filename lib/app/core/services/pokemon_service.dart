import 'dart:async';
import 'dart:io';
import 'http_service.dart';
import '../data/data_result.dart';
import '../data/exceptions.dart';
import '../models/pokemon_model.dart';

class PokemonService {
  PokemonService() : _httpService = HttpService(baseUrl: baseUrl);

  static const String baseUrl =
      'https://raw.githubusercontent.com/thak1996/PokemonGO-Pokedex/master';

  final HttpService _httpService;

  Future<DataResult<Pokemon>> getPokemonById(int id) async {
    final result = await getPokemons();
    return result.fold(
      (failure) => DataResult.failure(failure),
      (data) {
        try {
          final pokemon = data.pokemon.firstWhere(
            (pokemon) => pokemon.id == id,
          );
          return DataResult.success(pokemon);
        } catch (e) {
          return DataResult.failure(const APIException(
            code: 404,
            errorType: APIErrorType.notFound,
          ));
        }
      },
    );
  }

  Future<DataResult<PokemonResponse>> getPokemons() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final result = await _httpService.get('/pokedex.json');      
      return result.fold(
        (failure) => DataResult.failure(failure),
        (data) {
          if (data == null) {
            return DataResult.failure(const APIException(
              code: 204,
              errorType: APIErrorType.emptyResponse,
            ));
          }          
          try {
            final pokemonResponse = PokemonResponse.fromJson(data);
            if (pokemonResponse.pokemon.isEmpty) {
              return DataResult.failure(const APIException(
                code: 404,
                errorType: APIErrorType.notFound,
              ));
            }
            return DataResult.success(pokemonResponse);
          } on FormatException {
            return DataResult.failure(const APIException(
              code: 500,
              errorType: APIErrorType.invalidData,
            ));
          } catch (e) {
            return DataResult.failure(const APIException(
              code: 500,
              errorType: APIErrorType.serverError,
            ));
          }
        },
      );
    } on SocketException {
      return DataResult.failure(const APIException(
        code: 503,
        errorType: APIErrorType.noConnection,
      ));
    } on TimeoutException {
      return DataResult.failure(const APIException(
        code: 408,
        errorType: APIErrorType.timeout,
      ));
    } catch (e) {
      return DataResult.failure(const APIException(code: 500));
    }
  }
}
