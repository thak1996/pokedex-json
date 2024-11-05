import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/services/pokemon_service.dart';
import 'package:integration/app/modules/details/details_page.dart';
import 'details_controller.dart';

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
        return DetailsPage(pokemonId: pokemonId);
      },
    );
  }
}
