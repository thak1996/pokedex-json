import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:integration/app/core/models/pokemon_model.dart';
import 'package:integration/app/core/theme/app_styles.dart';
import 'package:integration/app/core/theme/theme_controller.dart';
import 'package:integration/app/modules/home/widgets/end_drawer.dart';
import 'package:provider/provider.dart';
import '../../core/services/pokemon_service.dart';
import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(PokemonService(), ThemeController()),
      builder: (context, child) {
        final controller = Provider.of<HomeController>(context);
        return Scaffold(
          backgroundColor: AppStyles.primaryColor,
          endDrawer: const EndDrawer(),
          body: Stack(
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  controller.themeController.themeMode == ThemeMode.dark
                      ? Colors.white
                      : Colors.grey[300]!,
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  'assets/images/pokeball.png',
                  height: 300.h,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Text(
                'Pokedex',
                style: AppStyles.headerStyles[Header.headline],
              ),
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 30,
                    color:
                        controller.themeController.themeMode == ThemeMode.dark
                            ? Colors.white
                            : Colors.black,
                  ),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 200.h,
                  left: 2.w,
                  right: 2.w,
                  bottom: 2.h,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                    boxShadow: AppStyles.outerShadow,
                  ),
                  child: SafeArea(
                    child: Expanded(child: _buildContent(controller)),
                  ),
                ),
              ),
            ],
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
      default:
        final pokemons = controller.pokemons;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
          ),
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            final typesOne = pokemon.type.first;
            final typesTwo = pokemon.type.length > 1 ? pokemon.type[1] : null;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: controller.getCardBackgroundColor(typesOne),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () => Modular.to.pushNamed('/details/${pokemon.id}'),
                  child: Stack(
                    children: [
                      imgPokeballCard(),
                      imgPokemonCard(pokemon),
                      typeOnePokemonCard(pokemon, typesOne, typesTwo),
                    ],
                  ),
                ),
              ),
            );
          },
        );
    }
  }

  Widget imgPokeballCard() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Opacity(
        opacity: 0.3,
        child: Image.asset(
          'assets/images/pokeball.png',
          height: 100.h,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget imgPokemonCard(Pokemon pokemon) {
    return Align(
      alignment: Alignment.bottomRight,
      child: CachedNetworkImage(
        imageUrl: pokemon.img,
        height: 100.h,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget typeOnePokemonCard(
    Pokemon pokemon,
    String typesOne,
    String? typesTwo,
  ) {
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      color: Colors.black26,
    );
    final padding = EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              pokemon.name,
              style: AppStyles.bodyStyles[Body.body1]?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Container(
            decoration: boxDecoration,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            padding: padding,
            child: Text(
              typesOne,
              style: AppStyles.bodyStyles[Body.body2]?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          if (typesTwo != null) ...[
            SizedBox(height: 4.h),
            Container(
              decoration: boxDecoration,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              padding: padding,
              child: Text(
                typesTwo,
                style: AppStyles.bodyStyles[Body.body2]?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
