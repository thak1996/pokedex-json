import 'http_service.dart';
import '../data/data_result.dart';
import '../data/exceptions.dart';
import '../models/pokemon_model.dart';

class PokemonService {
  PokemonService() : _httpService = HttpService(baseUrl: baseUrl);

  static const String baseUrl =
      'https://raw.githubusercontent.com/thak1996/PokemonGO-Pokedex/master';

  final HttpService _httpService;

  Future<DataResult<PokemonResponse>> getPokemons() async {
    await Future.delayed(const Duration(seconds: 2));
    final result = await _httpService.get('/pokedex.json');
    return result.fold(
      (failure) => DataResult.failure(failure),
      (data) {
        try {
          final pokemonResponse = PokemonResponse.fromJson(data);
          return DataResult.success(pokemonResponse);
        } catch (e) {
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
