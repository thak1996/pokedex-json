import 'package:flutter/material.dart';
import 'home_state.dart';

class HomeController extends ChangeNotifier {
  HomeState _state = const HomeInitialState();
  HomeState get state => _state;
  
  int _counter = 0;
  int get counter => _counter;

  void changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
