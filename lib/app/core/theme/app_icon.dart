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
    AssetImage? assetImage,
  }) {
    return SvgPicture.asset(
      'assets/icons/pokeball.svg',
      height: height ?? defaultHeight,
      width: width ?? defaultWidth,
      colorFilter: _getColorFilter(color),
    );
  }

  static Widget menu({
    double? height,
    double? width,
    Color? color,
  }) {
    return Transform.scale(
      scaleY: -1,
      child: Transform.rotate(
        angle: 2 * (3.14159 / 2),
        child: SvgPicture.asset(
          'assets/icons/sort.svg',
          height: height ?? defaultHeight,
          width: width ?? defaultWidth,
          colorFilter: _getColorFilter(color),
        ),
      ),
    );
  }
}
