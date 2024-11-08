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
    return Container(
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
    );
  }
} 