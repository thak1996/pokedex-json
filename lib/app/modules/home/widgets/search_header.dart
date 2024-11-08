import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_icon.dart';
import '../../../core/theme/app_styles.dart';
import 'search_field.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    super.key,
    required this.onChanged,
  });

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(onChanged: onChanged),
          SizedBox(width: 12.w),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppStyles.white,
                boxShadow: [
                  ...AppStyles.innerShadow2dp,
                  ...AppStyles.outerShadow,
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: AppIcon.filter(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
