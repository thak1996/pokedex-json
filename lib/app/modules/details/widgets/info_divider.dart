import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_styles.dart';

class InfoDivider extends StatelessWidget {
  const InfoDivider({
    super.key,
    this.height,
    this.color,
  });

  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
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
