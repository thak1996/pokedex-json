import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_styles.dart';

class AppIcon {
  static double defaultHeight = 40.h;
  static double defaultWidth = 40.w;
  static ColorFilter? _getColorFilter(Color? color) {
    return ColorFilter.mode(color ?? AppStyles.white, BlendMode.srcIn);
  }

  static Widget pokeball({
    double? height,
    double? width,
    Color? color,
  }) {
    return SvgPicture.asset(
      'assets/icons/pokeball.svg',
      height: height ?? defaultHeight,
      width: width ?? defaultWidth,
      colorFilter: _getColorFilter(color),
    );
  }

  static Widget menu({
    double? size,
    Color? color,
  }) {
    return Icon(
      Icons.menu,
      size: size ?? 32.h,
      color: color ?? AppStyles.white,
    );
  }

  static Widget search({
    double? height,
    double? width,
    Color? color,
  }) {
    height ??= 32.h;
    width ??= 32.w;
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/search.svg',
          height: height,
          width: width,
          colorFilter: ColorFilter.mode(
            color ?? AppStyles.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  static Widget filter({
    double? height,
    double? width,
    Color? color,
  }) {
    return SvgPicture.asset(
      'assets/icons/sort.svg',
      height: height ?? 32.h,
      width: width ?? 32.w,
      colorFilter: ColorFilter.mode(
        color ?? AppStyles.primaryColor,
        BlendMode.srcIn,
      ),
    );
  }
}
