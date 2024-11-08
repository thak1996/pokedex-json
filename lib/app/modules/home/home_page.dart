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
import 'widgets/home_header.dart';
import 'widgets/search_header.dart';

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
                  const HomeHeader(),
                  SizedBox(height: 12.h),
                  SearchHeader(
                    onChanged: (value) => controller.searchPokemon(value),
                    onSortTypeChanged: controller.toggleSortType,
                    currentSortType: controller.currentSortType,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 0.2.sh,
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
                  child: SafeArea(child: _buildContent(controller)),
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
      case const (HomeEmptyState):
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/pikachu_triste.png'),
              SizedBox(height: 16.h),
              Text(
                (state as HomeEmptyState).message,
                textAlign: TextAlign.center,
                style: AppStyles.bodyStyles[Body.body1],
              ),
            ],
          ),
        );
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
