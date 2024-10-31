import 'package:integration/app/core/data/data_result.dart';
import 'package:integration/app/core/data/exceptions.dart';

class AuthService {
  String? _token;
  DateTime? _tokenExpiration;

  Future<DataResult<bool>> isAuthenticated() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (_token == null) {
        return DataResult.failure(AuthException.authenticationRequired);
      }
      if (_isTokenExpired) {
        return DataResult.failure(AuthException.tokenExpired);
      }
      return DataResult.success(true);
    } catch (e) {
      return DataResult.failure(const GeneralException());
    }
  }

  Future<DataResult<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      if (email != 'teste@teste.com' || password != '123456') {
        return DataResult.failure(
          const APIException(code: 401, textCode: 'invalid-credentials'),
        );
      }

      _token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
      _tokenExpiration = DateTime.now().add(const Duration(hours: 1));

      return DataResult.success(_token!);
    } catch (e) {
      return DataResult.failure(const GeneralException());
    }
  }

  Future<DataResult<void>> logout() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      _token = null;
      _tokenExpiration = null;
      return DataResult.success(null);
    } catch (e) {
      return DataResult.failure(const GeneralException());
    }
  }

  bool get _isTokenExpired =>
      _tokenExpiration != null &&
      _tokenExpiration!.isBefore(
        DateTime.now(),
      );
}
