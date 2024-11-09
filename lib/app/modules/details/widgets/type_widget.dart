import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/models/pokemon_model.dart';
import '../../../core/theme/app_styles.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({
    super.key,
    required this.pokemonDetails,
    required this.getTypeColor,
  });

  final Pokemon pokemonDetails;
  final Color Function(String) getTypeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          spacing: 8.w,
          children: pokemonDetails.type.map((type) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                color: getTypeColor(type),
                borderRadius: BorderRadius.circular(50.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                type,
                style: AppStyles.bodyStyles[Body.body2]?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
