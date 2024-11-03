import 'package:flutter/material.dart';
import 'package:integration/app/core/service/poke_service.dart';
import 'package:provider/provider.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(PokeService()),
      builder: (context, child) {
        final controller = context.watch<HomeController>();
        return Scaffold(
          appBar: AppBar(title: const Text('Pokémon List')),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: controller.isLoading
                      ? null
                      : () => controller.fetchPokemons(),
                  child: Text(controller.isLoading
                      ? 'Carregando...'
                      : 'Buscar Pokémons'),
                ),
              ),
              Expanded(
                child: controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : controller.errorMessage != null
                        ? Center(child: Text(controller.errorMessage!))
                        : controller.pokemons == null
                            ? const Center(
                                child: Text(
                                    'Clique no botão para carregar os pokémons'),
                              )
                            : ListView.builder(
                                itemCount: controller.pokemons?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final pokemon = controller.pokemons![index];
                                  return ListTile(title: Text(pokemon['name']));
                                },
                              ),
              ),
            ],
          ),
        );
      },
    );
  }
}
