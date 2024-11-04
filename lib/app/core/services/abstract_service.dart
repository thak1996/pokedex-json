import '../data/data_result.dart';

abstract class AbstractService {
  Future<DataResult<T>> delete<T>(String endpoint);

  Future<DataResult<T>> get<T>(String endpoint);

  Future<DataResult<T>> post<T>(String endpoint, {Map<String, dynamic>? data});

  Future<DataResult<T>> put<T>(String endpoint, {Map<String, dynamic>? data});
}
