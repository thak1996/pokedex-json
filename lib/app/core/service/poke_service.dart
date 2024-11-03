import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:integration/app/core/data/data_result.dart';
import 'package:integration/app/core/data/exceptions.dart';

class PokeService {
  final String _baseUrl = 'https://pokeapi.co/api/v2';

  Future<DataResult<List<dynamic>>> fetchPokemons({int limit = 20, int offset = 0}) async {
    final response = await http.get(Uri.parse('$_baseUrl/pokemon?limit=$limit&offset=$offset'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return DataResult.success(data['results']);
    } else {
      return DataResult.failure(APIException(code: response.statusCode));
    }
  }

  Future<DataResult<Map<String, dynamic>>> fetchPokemonDetails(String name) async {
    final response = await http.get(Uri.parse('$_baseUrl/pokemon/$name'));

    if (response.statusCode == 200) {
      return DataResult.success(json.decode(response.body));
    } else {
      return DataResult.failure(APIException(code: response.statusCode));
    }
  }
}
