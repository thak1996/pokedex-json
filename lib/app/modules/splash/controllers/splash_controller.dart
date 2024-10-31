import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/services/auth_service.dart';
import 'package:integration/app/modules/splash/states/splash_state.dart';

class SplashController extends ChangeNotifier {
  final AuthService _authService;

  SplashState _state = const SplashInitialState();
  SplashState get state => _state;

  SplashController(this._authService);

  void changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> checkAuth() async {
    changeState(const SplashLoadingState());
    try {
      final bool isAuthenticated = await _authService.isAuthenticated();
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
