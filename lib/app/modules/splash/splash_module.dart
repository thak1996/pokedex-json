import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/services/auth_service.dart';
import 'controllers/splash_controller.dart';
import 'pages/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<SplashController>(
        () => SplashController(i<AuthService>()));
    i.addLazySingleton<AuthService>(AuthService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
