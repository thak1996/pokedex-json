import 'package:flutter_modular/flutter_modular.dart';
import 'controllers/home_controller.dart';
import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<HomeController>(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
} 