import 'package:flutter/material.dart';
import 'package:integration/app/core/services/pokemon_service.dart';
import 'package:integration/app/core/theme/widgets/theme_switch_button.dart';
import 'package:integration/app/modules/home/home_state.dart';
import 'package:provider/provider.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(PokemonService()),
      builder: (context, child) {
        final controller = context.watch<HomeController>();
        return Scaffold(
          appBar: AppBar(actions: const [ThemeSwitchButton()]),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [Expanded(child: _buildContent(controller))],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(HomeController controller) {
    final state = controller.state;
    switch (state.runtimeType) {
      case const (HomeLoadingState):
        return const Center(child: CircularProgressIndicator());
      case const (HomeErrorState):
        return Center(child: Text((state as HomeErrorState).message));
      case const (HomeSuccessState):
        final pokemons = controller.pokemons;
        if (pokemons == null) return const SizedBox.shrink();
        return ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            return ListTile(title: Text(pokemon.name));
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
