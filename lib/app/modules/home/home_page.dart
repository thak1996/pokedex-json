import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:integration/app/modules/home/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';
import '../../core/services/pokemon_service.dart';
import '../../core/theme/app_styles.dart';
import '../../core/theme/theme_controller.dart';
import 'widgets/end_drawer.dart';
import 'home_controller.dart';
import 'home_state.dart';
import 'widgets/icon.dart';

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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              constraints: BoxConstraints(maxHeight: 40.h),
                              child: AppIcon.pokeball(color: AppStyles.white),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Pokedex',
                              style: AppStyles.headerStyles[Header.headline]
                                  ?.apply(
                                color: AppStyles.white,
                              ),
                            ),
                          ],
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Icon(
                              Icons.menu,
                              size: 30,
                              color: AppStyles.white,
                            ),
                            onPressed: () =>
                                Scaffold.of(context).openEndDrawer(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 112.h,
                  left: 6.w,
                  right: 6.w,
                  bottom: 6.h,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    boxShadow: AppStyles.outerShadow,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: SafeArea(
                    child: _buildContent(controller),
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 4.h,
            crossAxisSpacing: 4.w,
          ),
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            return PokemonCard(
              onTap: () => Modular.to.pushNamed('/details/${pokemon.id}'),
              pokemon: pokemon,
            );
          },
        );
    }
  }
}
