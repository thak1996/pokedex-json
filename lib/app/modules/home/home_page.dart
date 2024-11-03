import 'package:flutter/material.dart';
import 'package:integration/app/core/services/pokemon_service.dart';
import 'package:integration/app/core/theme/widgets/theme_switch_button.dart';
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
          appBar: AppBar(
            title: const Text('Pokémon List'),
            actions: const [ThemeSwitchButton()],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: controller.isLoading
                        ? null
                        : () => controller.fetchPokemons(),
                    child: Text(controller.isLoading
                        ? 'Carregando...'
                        : 'Buscar Pokémons'),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: _buildContent(controller),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(HomeController controller) {
    if (controller.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (controller.errorMessage != null) {
      return Center(
        child: Text(controller.errorMessage!),
      );
    }

    if (controller.pokemons == null) {
      return const Center(
        child: Text('Clique no botão para carregar os pokémons'),
      );
    }

    return ListView.builder(
      itemCount: controller.pokemons!.length,
      itemBuilder: (context, index) {
        final pokemon = controller.pokemons![index];
        return ListTile(
          title: Text(pokemon.name),
        );
      },
    );
  }
}
