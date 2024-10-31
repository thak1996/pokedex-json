import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/services/auth_service.dart';
import 'package:integration/app/modules/login/login_page.dart';
import 'login_controller.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(() => LoginController(i<AuthService>()));
    i.addLazySingleton(AuthService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LoginPage());
  }
}
