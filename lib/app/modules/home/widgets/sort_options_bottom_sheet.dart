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
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      behavior: HitTestBehavior.opaque,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 200.w,
            decoration: BoxDecoration(
              color: AppStyles.primaryColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                  decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Sort by',
                        style:
                            AppStyles.headerStyles[Header.subTitle1]?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    bottom: 16.h,
                    top: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Column(
                    children: [
                      _SortOption(
                        title: 'Number',
                        isSelected: currentSortType == SortType.numeric,
                        onTap: () {
                          onSortTypeChanged(SortType.numeric);
                          Navigator.pop(context);
                        },
                      ),
                      _SortOption(
                        title: 'Name',
                        isSelected: currentSortType == SortType.alphabetic,
                        onTap: () {
                          onSortTypeChanged(SortType.alphabetic);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SortOption extends StatelessWidget {
  const _SortOption({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
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
              Radio<bool>(
                value: true,
                groupValue: isSelected ? true : false,
                onChanged: (_) => onTap(),
                activeColor: AppStyles.primaryColor,
              ),
              SizedBox(width: 8.w),
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
