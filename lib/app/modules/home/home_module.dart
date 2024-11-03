import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/services/pokemon_service.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(HomeController.new);
    i.addLazySingleton<PokemonService>(PokemonService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
