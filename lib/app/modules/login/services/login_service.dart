class LoginService {
  Future<void> login({
    required String email,
    required String password,
  }) async {
    // Implementar a lógica de autenticação aqui
    await Future.delayed(const Duration(seconds: 2));
  }
} 