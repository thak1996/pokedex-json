import 'package:flutter_modular/flutter_modular.dart';
import 'core/theme/theme_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<ThemeController>(ThemeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: SplashModule());
    r.module('/login', module: LoginModule());
    r.module('/home', module: HomeModule());
  }
}
