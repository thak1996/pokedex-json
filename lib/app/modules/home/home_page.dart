import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:integration/app/core/theme/app_text_styles.dart';
import 'package:provider/provider.dart';
import '../../core/services/pokemon_service.dart';
import '../../core/theme/widgets/theme_switch_button.dart';
import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
          ),
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            final typesOne = pokemon.type.first;
            final typesTwo = pokemon.type.length > 1 ? pokemon.type[1] : '';
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.green,
                ),
                child: Stack(
                  children: [
                    imgPokeball(),
                    Positioned(
                      right: 5.w,
                      bottom: 0.h,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img,
                        height: 100.h,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      top: 20.h,
                      left: 10.w,
                      child: Text(
                        pokemon.name,
                        style: AppTextStyles.titleText.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
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
                    ),
                    if (typesTwo.isNotEmpty)
                      Positioned(
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
                              style: AppTextStyles.bodyText
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Positioned imgPokeball() {
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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(PokemonService()),
      builder: (context, child) {
        final controller = context.watch<HomeController>();
        return Scaffold(
          appBar: AppBar(actions: const [ThemeSwitchButton()]),
          body: Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [Expanded(child: _buildContent(controller))],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
