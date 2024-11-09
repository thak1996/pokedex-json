import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_styles.dart';

class InfoDivider extends StatelessWidget {
  const InfoDivider({
    super.key,
    this.height,
    this.color,
    this.isLarge = false,
  });

  final double? height;
  final Color? color;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    if (isLarge) {
      return IntrinsicHeight(
        child: VerticalDivider(
          color: color ?? AppStyles.grayDark,
          thickness: 1,
          width: 32.w,
        ),
      );
    }

    return SizedBox(
      height: height ?? 40.h,
      child: VerticalDivider(
        color: color ?? AppStyles.grayDark,
        thickness: 1,
        width: 32.w,
        indent: 8.h,
        endIndent: 8.h,
      ),
    );
  }
}
