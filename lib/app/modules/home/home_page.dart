import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:integration/app/core/models/pokemon_model.dart';
import 'package:integration/app/core/theme/app_text_styles.dart';
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
          endDrawer: const EndDrawer(),
          body: Stack(
            children: [
              Positioned(
                top: -105.h,
                right: -85.w,
                child: ColorFiltered(
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
              ),
              Positioned(
                top: 150.h,
                left: 24.w,
                child: Text(
                  'Pokedex',
                  style: AppTextStyles.headlineText,
                ),
              ),
              Positioned(
                top: 25.h,
                right: 24.w,
                child: Builder(
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 200.h),
                child: SafeArea(
                  child: Column(
                    children: [Expanded(child: _buildContent(controller))],
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
                      titlePokemonCard(pokemon),
                      typeOnePokemonCard(typesOne),
                      if (typesTwo != null) typeTwoPokemonCard(typesTwo),
                    ],
                  ),
                ),
              ),
            );
          },
        );
    }
  }

  Positioned imgPokeballCard() {
    return Positioned(
      bottom: -10.h,
      right: -10.w,
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

  Positioned imgPokemonCard(Pokemon pokemon) {
    return Positioned(
      right: 5.w,
      bottom: 0.h,
      child: CachedNetworkImage(
        imageUrl: pokemon.img,
        height: 100.h,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Positioned titlePokemonCard(Pokemon pokemon) {
    return Positioned(
      top: 20.h,
      left: 10.w,
      child: Text(
        pokemon.name,
        style: AppTextStyles.titleText.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  Positioned typeOnePokemonCard(String typesOne) {
    return Positioned(
      top: 55.h,
      left: 10.w,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.black26,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 8.w,
            top: 4.h,
            bottom: 4.h,
            right: 8.w,
          ),
          child: Text(
            typesOne.toString(),
            style: AppTextStyles.bodyText.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Positioned typeTwoPokemonCard(String typesTwo) {
    return Positioned(
      top: 90.h,
      left: 10.w,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.black26,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 8.w,
            top: 4.h,
            bottom: 4.h,
            right: 8.w,
          ),
          child: Text(
            typesTwo,
            style: AppTextStyles.bodyText.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
