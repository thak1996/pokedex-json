import '../../core/models/pokemon_model.dart';

class HomeEmptyState extends HomeState {
  HomeEmptyState(this.message);

  final String message;
}

class HomeErrorState extends HomeState {
  HomeErrorState(this.message);

  final String message;
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

abstract class HomeState {}

class HomeSuccessState extends HomeState {
  HomeSuccessState(this.pokemons);

  final List<Pokemon> pokemons;
}
