import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/services/auth_service.dart';
import 'package:integration/app/modules/splash/states/splash_state.dart';

class SplashController extends ChangeNotifier {
  SplashController(this._authService);

  final AuthService _authService;
  SplashState _state = const SplashInitialState();

  SplashState get state => _state;

  void changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> checkAuth() async {
    changeState(const SplashLoadingState());
    try {
      final result = await _authService.isAuthenticated();
      result.fold(
        (error) async => await Modular.to.pushReplacementNamed('/login/'),
        (isAuthenticated) async {
          await Modular.to.pushReplacementNamed('/home/');
          changeState(const SplashSuccessState());
        },
      );
    } catch (e) {
      changeState(SplashErrorState(e.toString()));
    }
  }
}
