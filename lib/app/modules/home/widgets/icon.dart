import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon {
  static Widget pokeball({
    double? height,
    double? width,
    Color? color,
    AssetImage? assetImage,
  }) {
    return SvgPicture.asset(
      assetImage?.assetName ?? 'assets/icons/pokeball.svg',
      height: height,
      width: width,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }
}
