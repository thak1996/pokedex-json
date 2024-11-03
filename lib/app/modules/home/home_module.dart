import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/service/poke_service.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(HomeController.new);
    i.addLazySingleton<PokeService>(PokeService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
