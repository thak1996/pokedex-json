import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Body {
  body1,
  body2,
  body3,
  caption,
}

enum Header {
  headline,
  subTitle1,
  subTitle2,
  subTitle3,
}

class AppStyles {
  static final Map<Body, TextStyle> bodyStyles = {
    Body.body1: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14.sp,
    ),
    Body.body2: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.sp,
    ),
    Body.body3: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.sp,
    ),
    Body.caption: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 10.sp,
    ),
  };

  static final Map<Header, TextStyle> headerStyles = {
    Header.headline: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24.sp,
    ),
    Header.subTitle1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
    ),
    Header.subTitle2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12.sp,
    ),
    Header.subTitle3: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10.sp,
    ),
  };

  // Backgrounds
  static Color get background => const Color(0xffefefef);

  // Grayscale
  static Color get grayDark => const Color(0xff212121);
  static Color get grayLight => const Color(0xffe0e0e0);
  static Color get grayMedium => const Color(0xff666666);

  // Pokemon Types Colors
  static Color get pokeColorBug => const Color(0xffa7b723);
  static Color get pokeColorDark => const Color(0xff75574C);
  static Color get pokeColorDragon => const Color(0xff7037FF);
  static Color get pokeColorElectric => const Color(0xffF9CF30);
  static Color get pokeColorFairy => const Color(0xffE69EAC);
  static Color get pokeColorFighting => const Color(0xffC12239);
  static Color get pokeColorFire => const Color(0xffF57D31);
  static Color get pokeColorFlying => const Color(0xffA891EC);
  static Color get pokeColorGhost => const Color(0xff70559B);
  static Color get pokeColorGrass => const Color(0xff74CB48);
  static Color get pokeColorGround => const Color(0xffDEC16B);
  static Color get pokeColorIce => const Color(0xff9AD6DF);
  static Color get pokeColorNormal => const Color(0xffAAA67F);
  static Color get pokeColorPoison => const Color(0xffA43E9E);
  static Color get pokeColorPsychic => const Color(0xffFB5584);
  static Color get pokeColorRock => const Color(0xffB69E31);
  static Color get pokeColorSteel => const Color(0xffB7B9D0);
  static Color get pokeColorWater => const Color(0xff6493EB);

  static Color get primaryColor => const Color(0xffDC0A2D);
  static Color get white => const Color(0xffffffff);

  static List<BoxShadow> get outerShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(0, 2),
          blurRadius: 4,
          spreadRadius: 0,
        ),
      ];

  // Getter para BoxShadow interno de 2dp
  static List<BoxShadow> get innerShadow2dp => [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(0, 0),
          blurRadius: 2,
          spreadRadius: -2,
        ),
      ];

  // Getter para BoxShadow interno de 6dp
  static List<BoxShadow> get innerShadow6dp => [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(0, 0),
          blurRadius: 6,
          spreadRadius: -3,
        ),
      ];
}
