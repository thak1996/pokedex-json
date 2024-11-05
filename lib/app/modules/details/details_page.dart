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
      builder: (context, child) {
        final controller = Provider.of<DetailsController>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detalhes do Pokémon'),
          ),
          body: _buildContent(controller),
        );
      },
    );
  }

  Widget _buildContent(DetailsController controller) {
    final state = controller.state;
    switch (state.runtimeType) {
      case const (DetailsLoadingState):
        return const Center(child: CircularProgressIndicator());
      case const (DetailsErrorState):
        return Center(child: Text((state as DetailsErrorState).message));
      case const (DetailsSuccessState):
      default:
        final pokemonDetails = (state as DetailsSuccessState).pokemon;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(pokemonDetails.img),
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
        );
    }
  }
}
