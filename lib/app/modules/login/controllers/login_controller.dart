import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/services/auth_service.dart';
import '../states/login_state.dart';

class LoginController extends ChangeNotifier {
  final AuthService _authService;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  LoginState _state = const LoginInitialState();
  LoginState get state => _state;
  
  LoginController(this._authService);
  
  void changeState(LoginState newState) {
    _state = newState;
    notifyListeners();
  }
  
  Future<void> executeLogin() async {
    changeState(const LoginLoadingState());
    
    final result = await _authService.login(
      email: emailController.text,
      password: passwordController.text,
    );
    
    result.fold(
      (error) => changeState(LoginErrorState(error.message)),
      (token) async {
        changeState(const LoginSuccessState());
        await Modular.to.pushReplacementNamed('/home');
      },
    );
  }
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
} 