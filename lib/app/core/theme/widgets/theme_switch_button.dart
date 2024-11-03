import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/theme/theme_controller.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Modular.get<ThemeController>();

    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return IconButton(
          onPressed: themeController.toggleTheme,
          icon: Icon(
            isDark ? Icons.light_mode : Icons.dark_mode,
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}
