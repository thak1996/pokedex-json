import 'package:flutter_modular/flutter_modular.dart';
import '../../core/services/pokemon_service.dart';
import 'details_controller.dart';
import 'details_page.dart';

class DetailsModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<DetailsController>(
      () => DetailsController(i.get<PokemonService>()),
    );
    i.addLazySingleton<PokemonService>(() => PokemonService());
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/:id',
      child: (context) {
        final pokemonId = int.parse(r.args.params['id']);
        final pokemons = Modular.args.data['pokemons'];
        final currentIndex = pokemons.indexWhere((pokemon) => pokemon.id == pokemonId);
        return DetailsPage(
          pokemons: pokemons,
          currentIndex: currentIndex,
        );
      },
    );
  }
}
