import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../core/models/pokemon_model.dart';
import '../../core/services/pokemon_service.dart';
import '../../core/theme/app_styles.dart';
import '../../core/theme/theme_controller.dart';
import 'widgets/end_drawer.dart';
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
            crossAxisCount: 3,
            childAspectRatio: 1,
          ),
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            final typesOne = pokemon.type.first;
            final number = pokemon.id.toString().padLeft(3, '0');
            return Padding(
              padding: EdgeInsets.only(
                left: 4.w,
                right: 4.w,
                bottom: 4.h,
                top: 4.h,
              ),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                color: controller.getCardBackgroundColor(typesOne),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () => Modular.to.pushNamed('/details/${pokemon.id}'),
                  child: Stack(
                    children: [
                      imgPokeballCard(),
                      imgPokemonCard(pokemon),
                      namePokemonCard(pokemon),
                      idPokemonCard(number),
                    ],
                  ),
                ),
              ),
            );
          },
        );
    }
  }

  Widget idPokemonCard(String number) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(right: 8.w, top: 8.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.black38,
          ),
          child: Text(
            '#$number',
            style: AppStyles.bodyStyles[Body.caption]?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget imgPokeballCard() {
    return Align(
      alignment: Alignment.center,
      child: Opacity(
        opacity: 0.3,
        child: Image.asset(
          'assets/images/pokeball.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget imgPokemonCard(Pokemon pokemon) {
    return Align(
      alignment: Alignment.center,
      child: CachedNetworkImage(
        imageUrl: pokemon.img,
        height: 100.h,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget namePokemonCard(Pokemon pokemon) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        margin: EdgeInsets.only(bottom: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.black38,
        ),
        child: Text(
          pokemon.name,
          style: AppStyles.bodyStyles[Body.caption]?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
