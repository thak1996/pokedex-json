import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'core/utils/util_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Modular.get<ThemeController>();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return AnimatedBuilder(
          animation: themeController,
          builder: (context, _) {
            TextTheme textTheme = createTextTheme(context, "Roboto", "Poppins");
            MaterialTheme theme = MaterialTheme(textTheme);
            return MaterialApp.router(
              title: 'Pokemon API',
              debugShowCheckedModeBanner: false,
              theme: theme.light(),
              darkTheme: theme.dark(),
              themeMode: themeController.themeMode,
              routerDelegate: Modular.routerDelegate,
              routeInformationParser: Modular.routeInformationParser,
            );
          },
        );
      },
    );
  }
}
