import 'package:flutter_modular/flutter_modular.dart';
import 'core/services/pokemon_service.dart';
import 'core/theme/theme_controller.dart';
import 'modules/details/details_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<ThemeController>(ThemeController.new);
    i.addLazySingleton<PokemonService>(PokemonService.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
    r.module('/details', module: DetailsModule());
  }
}
