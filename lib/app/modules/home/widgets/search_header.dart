import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_icon.dart';
import '../../../core/theme/app_styles.dart';
import '../home_controller.dart';
import 'search_field.dart';

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

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ordenar por',
              style: AppStyles.headerStyles[Header.subTitle1],
            ),
            SizedBox(height: 16.h),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: currentSortType == SortType.numeric
                    ? AppStyles.primaryColor
                    : null,
              ),
              title: const Text('Ordem Numérica'),
              selected: currentSortType == SortType.numeric,
              onTap: () {
                onSortTypeChanged(SortType.numeric);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.sort_by_alpha,
                color: currentSortType == SortType.alphabetic
                    ? AppStyles.primaryColor
                    : null,
              ),
              title: const Text('Ordem Alfabética'),
              selected: currentSortType == SortType.alphabetic,
              onTap: () {
                onSortTypeChanged(SortType.alphabetic);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

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
            onTap: () => _showSortOptions(context),
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
                child: AppIcon.filter(
                  height: 24.h,
                  width: 24.w,
                  color: AppStyles.primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
