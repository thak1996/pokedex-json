import '../../core/models/pokemon_model.dart';

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

class HomeSuccessState extends HomeState {
  const HomeSuccessState(this.pokemons);

  final List<Pokemon> pokemons;
}
