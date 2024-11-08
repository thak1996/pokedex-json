import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_icon.dart';
import '../../../core/theme/app_styles.dart';
import '../home_controller.dart';
import 'search_field.dart';
import 'sort_options_bottom_sheet.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    super.key,
    required this.onChanged,
    required this.onSortTypeChanged,
    required this.currentSortType,
  });

  final void Function(String)? onChanged;
  final void Function(SortType) onSortTypeChanged;
  final SortType currentSortType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(onChanged: onChanged),
          SizedBox(width: 12.w),
          _buttonSearch(context),
        ],
      ),
    );
  }

  Container _buttonSearch(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppStyles.white,
        boxShadow: [
          ...AppStyles.innerShadow2dp,
          ...AppStyles.outerShadow,
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(24.r),
          onTap: () => showDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.6),
            builder: (_) => SortOptionsBottomSheet(
              currentSortType: currentSortType,
              onSortTypeChanged: onSortTypeChanged,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: AppIcon.filter(
              height: 24.h,
              width: 24.w,
              color: AppStyles.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
