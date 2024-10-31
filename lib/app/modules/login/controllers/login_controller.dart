import 'package:flutter/material.dart';
import '../states/login_state.dart';
import '../services/login_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginController extends ChangeNotifier {
  final LoginService _loginService;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  LoginState _state = const LoginInitialState();
  LoginState get state => _state;
  
  LoginController(this._loginService);
  
  void changeState(LoginState newState) {
    _state = newState;
    notifyListeners();
  }
  
  Future<void> executeLogin() async {
    changeState(const LoginLoadingState());
    try {
      final email = emailController.text;
      final password = passwordController.text;
      
      await _loginService.login(email: email, password: password);
      changeState(const LoginSuccessState());
      await Modular.to.pushReplacementNamed('/home');
    } catch (err) {
      changeState(LoginErrorState(err.toString()));
    }
  }
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
} 