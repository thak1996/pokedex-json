import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/models/pokemon_model.dart';
import '../../../core/theme/app_icon.dart';
import '../../../core/theme/app_styles.dart';
import 'info_divider.dart';

class InfoPokemon extends StatelessWidget {
  const InfoPokemon({super.key, required this.pokemonDetails});

  final Pokemon pokemonDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 16.h,
      ),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        runSpacing: 16.h,
        spacing: 16.w,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppIcon.weight(),
                  SizedBox(width: 8.w),
                  Text(
                    pokemonDetails.weight,
                    style: AppStyles.bodyStyles[Body.body3]?.apply(
                      color: AppStyles.grayDark,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                "Weight",
                style: AppStyles.bodyStyles[Body.caption]?.apply(
                  color: AppStyles.grayMedium,
                ),
              ),
            ],
          ),
          const InfoDivider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppIcon.height(),
                  SizedBox(width: 8.w),
                  Text(
                    pokemonDetails.height,
                    style: AppStyles.bodyStyles[Body.body3]?.apply(
                      color: AppStyles.grayDark,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                "Height",
                style: AppStyles.bodyStyles[Body.caption]?.apply(
                  color: AppStyles.grayMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
