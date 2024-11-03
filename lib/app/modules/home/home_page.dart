import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration/app/core/theme/app_text_styles.dart';
import 'package:integration/app/modules/home/home_controller.dart';
import 'package:integration/app/core/theme/widgets/theme_switch_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: const [ThemeSwitchButton()],
        title: Text('Flutter Demo Home Page', style: AppTextStyles.titleText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: AppTextStyles.bodyText,
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Text(
                '${controller.loadPokemons()}',
                style: AppTextStyles.headlineText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
