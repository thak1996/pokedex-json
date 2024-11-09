import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:integration/app/core/models/pokemon_model.dart';
import 'package:integration/app/core/theme/app_icon.dart';
import '../../core/services/pokemon_service.dart';
import '../../core/theme/app_styles.dart';
import 'details_controller.dart';
import 'details_state.dart';
import 'package:provider/provider.dart';
import 'widgets/info_pokemon.dart';
import 'widgets/stats_widget.dart';
import 'widgets/type_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.pokemonId});

  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailsController(
        PokemonService(),
      )..loadDetails(pokemonId),
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
        final errorState = state as DetailsErrorState;
        return Center(
          child: Text(
            errorState.message,
            style: AppStyles.bodyStyles[Body.body1],
          ),
        );
      case const (DetailsSuccessState):
      default:
        final pokemonDetails = (state as DetailsSuccessState).pokemon;
        final List<Map<String, dynamic>> statsList = [
          {"label": "HP", "value": pokemonDetails.stats.hp},
          {"label": "ATK", "value": pokemonDetails.stats.attack},
          {"label": "DEF", "value": pokemonDetails.stats.defense},
          {"label": "SATK", "value": pokemonDetails.stats.specialAttack},
          {"label": "SDEF", "value": pokemonDetails.stats.specialDefense},
          {"label": "SPD", "value": pokemonDetails.stats.speed},
        ];
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _backgroundPokeball(),
            _headerDetails(pokemonDetails),
            Container(
              height: 0.65.sh,
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 20.h,
                top: 80.h,
              ),
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: AppStyles.outerShadow,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  TypeWidget(
                    pokemonDetails: pokemonDetails,
                    getTypeColor: controller.getCardBackgroundColor,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "About",
                    style: AppStyles.headerStyles[Header.subTitle1]?.apply(
                      color: controller.getCardBackgroundColor(
                        pokemonDetails.type.first,
                      ),
                    ),
                  ),
                  WeightHeightPokemon(pokemonDetails: pokemonDetails),
                  SizedBox(height: 16.h),
                  Text(
                    pokemonDetails.description,
                    textAlign: TextAlign.center,
                    style: AppStyles.bodyStyles[Body.body3]?.apply(
                      color: AppStyles.grayDark,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    children: [
                      Text(
                        "Base Stats",
                        style: AppStyles.headerStyles[Header.subTitle1]?.apply(
                          color: controller.getCardBackgroundColor(
                            pokemonDetails.type.first,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      for (var stat in statsList) ...[
                        StatsWidget(
                          label: stat["label"],
                          value: stat["value"],
                          maxValue: 200,
                          color: controller.getCardBackgroundColor(
                            pokemonDetails.type.first,
                          ),
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ],
                  )
                ],
              ),
            ),
            _pokemonImage(pokemonDetails),
          ],
        );
    }
  }

  Align _headerDetails(Pokemon pokemonDetails) => Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          height: 75.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Modular.to.pop(),
                      icon: AppIcon.back(),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      pokemonDetails.name,
                      style: AppStyles.headerStyles[Header.headline]
                          ?.apply(color: AppStyles.white),
                    )
                  ],
                ),
                Text(
                  "# ${pokemonDetails.num.toString()}",
                  style: AppStyles.headerStyles[Header.subTitle2]
                      ?.apply(color: AppStyles.white),
                ),
              ],
            ),
          ),
        ),
      );

  Align _pokemonImage(Pokemon pokemonDetails) => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 0.22.sh),
          child: Image.network(
            pokemonDetails.img,
            height: 150.h,
            fit: BoxFit.fitHeight,
          ),
        ),
      );

  Align _backgroundPokeball() => Align(
        alignment: Alignment.topRight,
        child: Opacity(
          opacity: 0.2,
          child: Image.asset(
            'assets/images/pokeball.png',
            height: 275.h,
            fit: BoxFit.fitHeight,
          ),
        ),
      );
}
