import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/services/auth_service.dart';
import 'controllers/splash_controller.dart';
import 'pages/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<AuthService>(() => AuthService());
    i.addLazySingleton<SplashController>(() => SplashController(i()));
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
