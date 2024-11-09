import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_styles.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({
    super.key,
    required this.label,
    required this.value,
    required this.maxValue,
    required this.color,
  });

  final String label;
  final int value;
  final int maxValue;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30.w,
          child: Text(
            label,
            style: AppStyles.bodyStyles[Body.body2],
          ),
        ),
        Container(
          width: 1,
          height: 20.h,
          color: Colors.grey,
          margin: EdgeInsets.symmetric(horizontal: 8.w),
        ),
        SizedBox(
          width: 20.w,
          child: Text(
            value.toString(),
            style: AppStyles.bodyStyles[Body.body2],
            textAlign: TextAlign.end,
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20.w),
            height: 8.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: value / maxValue,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
