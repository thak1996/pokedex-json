import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/services/pokemon_service.dart';
import 'details_controller.dart';
import 'details_state.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.pokemonId});

  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailsController(PokemonService())
        ..loadDetails(
          pokemonId,
        ),
      builder: (context, child) {
        final controller = Provider.of<DetailsController>(context);
        return Scaffold(
          backgroundColor: controller.getCardBackgroundColor(
            controller.state is DetailsSuccessState
                ? (controller.state as DetailsSuccessState).pokemon.type.first
                : '',
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
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 0.2.sh),
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    'assets/images/pokeball.png',
                    height: 200.h,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Container(
              height: 0.6.sh,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 0.3.sh),
                child: Image.network(
                  pokemonDetails.img,
                  height: 150.h,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        );
    }
  }
}
