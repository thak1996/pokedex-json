import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/services/auth_service.dart';
import 'controllers/login_controller.dart';
import 'pages/login_page.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<LoginController>(
        () => LoginController(i<AuthService>()));
    i.addLazySingleton<AuthService>(AuthService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LoginPage());
  }
}
