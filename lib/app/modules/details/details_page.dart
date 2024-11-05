import 'package:flutter/material.dart';
import 'package:integration/app/core/theme/app_text_styles.dart';
import 'details_controller.dart';
import 'details_state.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.pokemonId});

  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailsController()..loadDetails(pokemonId),
      child: Consumer<DetailsController>(
        builder: (context, controller, child) {
          if (controller.state is DetailsLoadingState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Loading...'),
              ),
              body: const Center(child: CircularProgressIndicator()),
            );
          } else if (controller.state is DetailsSuccessState) {
            final pokemonDetails =
                (controller.state as DetailsSuccessState).pokemon;
            return Scaffold(
              appBar: AppBar(
                title: Text(pokemonDetails.name),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                        pokemonDetails.img), // Exibe a imagem do Pokémon
                    const SizedBox(height: 16),
                    Text(
                      'Name: ${pokemonDetails.name}',
                      style: AppTextStyles.titleText,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Types: ${pokemonDetails.type.join(', ')}', // Exibe os tipos do Pokémon
                      style: AppTextStyles.bodyText,
                    ),
                    // Adicione mais informações conforme necessário
                  ],
                ),
              ),
            );
          } else if (controller.state is DetailsErrorState) {
            final errorMessage =
                (controller.state as DetailsErrorState).message;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: Center(child: Text(errorMessage)), // Exibe mensagem de erro
            );
          }
          return Container(); // Retorna um container vazio se o estado não for reconhecido
        },
      ),
    );
  }
}
