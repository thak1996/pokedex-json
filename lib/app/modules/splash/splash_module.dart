import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/services/auth_service.dart';
import 'splash_controller.dart';
import 'splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(() => SplashController(i<AuthService>()));
    i.addLazySingleton(AuthService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
