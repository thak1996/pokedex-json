import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_icon.dart';
import '../../../core/theme/app_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({required this.onChanged, super.key});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            ...AppStyles.innerShadow2dp,
            ...AppStyles.outerShadow,
          ],
        ),
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Search Pokemon',
            hintStyle: AppStyles.bodyStyles[Body.body3]?.copyWith(
              color: AppStyles.grayMedium,
            ),
            prefixIcon: AppIcon.search(),
            filled: true,
            fillColor: AppStyles.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(24.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppStyles.primaryColor.withOpacity(0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
          style: AppStyles.bodyStyles[Body.body3]?.copyWith(
            color: AppStyles.grayMedium,
          ),
        ),
      ),
    );
  }
}
