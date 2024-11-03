import 'package:integration/app/core/data/data_result.dart';
import 'package:integration/app/core/services/http_service.dart';
import 'package:integration/app/core/models/pokemon_pagination_model.dart';

class PokemonService {
  final HttpService _httpService;

  PokemonService()
      : _httpService = HttpService(
          baseUrl: 'https://pokeapi.co/api/v2',
        );

  Future<DataResult<PokemonPaginationModel>> getPokemons() async {
    final result = await _httpService.get<Map<String, dynamic>>('/pokemon');

    return result.fold(
      (error) => DataResult.failure(error),
      (data) => DataResult.success(PokemonPaginationModel.fromJson(data)),
    );
  }
}
