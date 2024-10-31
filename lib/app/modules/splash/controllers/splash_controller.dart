import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../states/splash_state.dart';

class SplashController extends ChangeNotifier {
  SplashState _state = const SplashInitialState();
  SplashState get state => _state;

  void changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> checkAuth() async {
    changeState(const SplashLoadingState());

    try {
      await Future.delayed(const Duration(seconds: 2));
      // Aqui você deve implementar a verificação de autenticação
      const bool isAuthenticated = false;

      if (isAuthenticated) {
        await Modular.to.pushReplacementNamed('/home');
      } else {
        await Modular.to.pushReplacementNamed('/login');
      }

      changeState(const SplashSuccessState());
    } catch (err) {
      changeState(SplashErrorState(err.toString()));
    }
  }
}
