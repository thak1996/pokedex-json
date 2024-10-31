abstract class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {
  final int counter;
  const HomeInitialState({this.counter = 0});
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeErrorState extends HomeState {
  final String message;
  const HomeErrorState(this.message);
} 