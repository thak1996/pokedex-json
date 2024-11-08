import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/models/pokemon_model.dart';
import '../../../core/models/pokemon_type.dart';
import '../../../core/theme/app_styles.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.onTap,
  });

  final Function()? onTap;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final typesOne = pokemon.type.first;
    final number = pokemon.id.toString().padLeft(3, '0');
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      color: PokemonTypeInfo.getColor(typesOne).withOpacity(0.7),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: onTap,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/pokeball.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: pokemon.img,
                height: 100.h,
                fit: BoxFit.fitHeight,
              ),
            ),
            Align(
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
                    color: AppStyles.white,
                  ),
                ),
              ),
            ),
            Align(
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
                      color: AppStyles.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
