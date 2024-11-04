class HomeErrorState extends HomeState {
  const HomeErrorState(this.message);

  final String message;
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

abstract class HomeState {
  const HomeState();
}

class HomeSuccessState<T> extends HomeState {
  const HomeSuccessState(this.data);

  final List<T> data;
}
