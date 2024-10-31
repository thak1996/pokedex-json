class AuthService {
  // Simula um token armazenado
  String? _token;

  // Simula verificação de autenticação
  Future<bool> isAuthenticated() async {
    await Future.delayed(const Duration(seconds: 2));
    return _token != null;
  }

  // Simula login
  Future<void> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    _token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
  }

  // Simula logout
  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    _token = null;
  }
} 