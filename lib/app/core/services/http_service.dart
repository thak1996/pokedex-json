import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/data_result.dart';
import '../data/exceptions.dart';
import 'abstract_service.dart';

class HttpService implements AbstractService {
  HttpService({required this.baseUrl});

  final String baseUrl;

  @override
  Future<DataResult<T>> delete<T>(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
      return _handleResponse<T>(response);
    } catch (e) {
      return DataResult.failure(const GeneralException());
    }
  }

  @override
  Future<DataResult<T>> get<T>(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));
      return _handleResponse<T>(response);
    } catch (e) {
      return DataResult.failure(const GeneralException());
    }
  }

  @override
  Future<DataResult<T>> post<T>(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );
      return _handleResponse<T>(response);
    } catch (e) {
      return DataResult.failure(const GeneralException());
    }
  }

  @override
  Future<DataResult<T>> put<T>(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );
      return _handleResponse<T>(response);
    } catch (e) {
      return DataResult.failure(const GeneralException());
    }
  }

  DataResult<T> _handleResponse<T>(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = json.decode(response.body);
      return DataResult.success(data as T);
    }
    return DataResult.failure(APIException(code: response.statusCode));
  }
}
