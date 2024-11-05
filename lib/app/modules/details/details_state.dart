import 'package:integration/app/core/models/pokemon_model.dart';

class DetailsErrorState extends DetailsState {
  DetailsErrorState(this.message);

  final String message;
}

class DetailsInitialState extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

abstract class DetailsState {}

class DetailsSuccessState extends DetailsState {
  DetailsSuccessState(this.pokemon);

  final Pokemon pokemon;
}
