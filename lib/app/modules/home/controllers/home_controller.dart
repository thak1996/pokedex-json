import 'package:flutter/material.dart';
import '../states/home_state.dart';

class HomeController extends ChangeNotifier {
  HomeState _state = const HomeInitialState();
  HomeState get state => _state;

  int get counter => (_state as HomeInitialState).counter;

  void changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  void incrementCounter() {
    if (_state is HomeInitialState) {
      final currentState = _state as HomeInitialState;
      changeState(HomeInitialState(counter: currentState.counter + 1));
    }
  }

  void decrementCounter() {
    if (_state is HomeInitialState) {
      final currentState = _state as HomeInitialState;
      changeState(HomeInitialState(counter: currentState.counter - 1));
    }
  }
}
