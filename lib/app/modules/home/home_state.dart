class HomeErrorState extends HomeState {
  HomeErrorState(this.message);

  final String message;
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

abstract class HomeState {}

class HomeSuccessState<T> extends HomeState {
  HomeSuccessState(this.data);

  final List<T> data;
}
