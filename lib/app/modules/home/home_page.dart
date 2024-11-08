import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../core/services/pokemon_service.dart';
import '../../core/theme/app_styles.dart';
import '../../core/theme/theme_controller.dart';
import 'home_controller.dart';
import 'home_state.dart';
import '../../core/widgets/empty_state_text.dart';
import '../../core/widgets/error_state_text.dart';
import 'widgets/home_header.dart';
import 'widgets/pokemon_card.dart';
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
                  top: 0.19.sh,
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
      case const (HomeSuccessState):
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
      case const (HomeEmptyState):
        final emptyState = state as HomeEmptyState;
        return EmptyStateText(text: emptyState.message);
      case const (HomeErrorState):
        final errorState = state as HomeErrorState;
        return ErrorStateText(
          onPressed: controller.fetchPokemons,
          text: errorState.message,
        );
      default:
        return ErrorStateText(
          onPressed: controller.fetchPokemons,
          text: 'An unexpected error occurred',
        );
    }
  }
}
