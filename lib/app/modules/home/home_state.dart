import 'package:integration/app/core/models/pokemon_model.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeSuccessState extends HomeState {
  const HomeSuccessState(this.pokemons);

  final List<Pokemon> pokemons;
}

class HomeErrorState extends HomeState {
  const HomeErrorState(this.message);

  final String message;
}
