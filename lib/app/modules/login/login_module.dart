import 'package:flutter_modular/flutter_modular.dart';
import 'controllers/login_controller.dart';
import 'pages/login_page.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<LoginController>(() => LoginController(i()));
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LoginPage());
  }
}
