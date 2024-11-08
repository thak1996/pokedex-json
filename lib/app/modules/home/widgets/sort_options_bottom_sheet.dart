import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_styles.dart';
import '../home_controller.dart';

class SortOptionsBottomSheet extends StatelessWidget {
  const SortOptionsBottomSheet({
    super.key,
    required this.currentSortType,
    required this.onSortTypeChanged,
  });

  final SortType currentSortType;
  final void Function(SortType) onSortTypeChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 280.w,
          padding: EdgeInsets.symmetric(
            vertical: 24.h,
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sort by',
                style: AppStyles.headerStyles[Header.subTitle1],
              ),
              SizedBox(height: 16.h),
              _SortOption(
                title: 'Numeric Order',
                icon: Icons.format_list_numbered,
                isSelected: currentSortType == SortType.numeric,
                onTap: () {
                  onSortTypeChanged(SortType.numeric);
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 8.h),
              _SortOption(
                title: 'Alphabetical Order',
                icon: Icons.sort_by_alpha,
                isSelected: currentSortType == SortType.alphabetic,
                onTap: () {
                  onSortTypeChanged(SortType.alphabetic);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SortOption extends StatelessWidget {
  const _SortOption({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color:
                    isSelected ? AppStyles.primaryColor : AppStyles.grayMedium,
                size: 24.h,
              ),
              SizedBox(width: 16.w),
              Text(
                title,
                style: AppStyles.bodyStyles[Body.body1]?.copyWith(
                  color: isSelected
                      ? AppStyles.primaryColor
                      : AppStyles.grayMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
