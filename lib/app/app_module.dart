import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/service/poke_service.dart';
import 'core/theme/theme_controller.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<ThemeController>(ThemeController.new);
    i.addLazySingleton<PokeService>(PokeService.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/home', module: HomeModule());
  }
}
