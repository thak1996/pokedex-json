import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff904a48),
      surfaceTint: Color(0xff904a48),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad8),
      onPrimaryContainer: Color(0xff3b080a),
      secondary: Color(0xff775655),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdad8),
      onSecondaryContainer: Color(0xff2c1514),
      tertiary: Color(0xff735a2e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdea9),
      onTertiaryContainer: Color(0xff271900),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff231919),
      onSurfaceVariant: Color(0xff534342),
      outline: Color(0xff857372),
      outlineVariant: Color(0xffd7c1c0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffb3b0),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff3b080a),
      primaryFixedDim: Color(0xffffb3b0),
      onPrimaryFixedVariant: Color(0xff733332),
      secondaryFixed: Color(0xffffdad8),
      onSecondaryFixed: Color(0xff2c1514),
      secondaryFixedDim: Color(0xffe7bdba),
      onSecondaryFixedVariant: Color(0xff5d3f3e),
      tertiaryFixed: Color(0xffffdea9),
      onTertiaryFixed: Color(0xff271900),
      tertiaryFixedDim: Color(0xffe3c28c),
      onTertiaryFixedVariant: Color(0xff5a4319),
      surfaceDim: Color(0xffe8d6d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae8),
      surfaceContainerHigh: Color(0xfff6e4e3),
      surfaceContainerHighest: Color(0xfff0dedd),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6e2f2e),
      surfaceTint: Color(0xff904a48),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffaa5f5d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff593b3a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8f6c6a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff553f16),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8b7042),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff231919),
      onSurfaceVariant: Color(0xff4e3f3e),
      outline: Color(0xff6c5b5a),
      outlineVariant: Color(0xff897675),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffb3b0),
      primaryFixed: Color(0xffaa5f5d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff8d4846),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8f6c6a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff745452),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8b7042),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff71582c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae8),
      surfaceContainerHigh: Color(0xfff6e4e3),
      surfaceContainerHighest: Color(0xfff0dedd),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff440f10),
      surfaceTint: Color(0xff904a48),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6e2f2e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff341b1b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff593b3a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff301f00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff553f16),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2e2120),
      outline: Color(0xff4e3f3e),
      outlineVariant: Color(0xff4e3f3e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffe7e5),
      primaryFixed: Color(0xff6e2f2e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff521a1a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff593b3a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff402625),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff553f16),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3d2902),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae8),
      surfaceContainerHigh: Color(0xfff6e4e3),
      surfaceContainerHighest: Color(0xfff0dedd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3b0),
      surfaceTint: Color(0xffffb3b0),
      onPrimary: Color(0xff571d1d),
      primaryContainer: Color(0xff733332),
      onPrimaryContainer: Color(0xffffdad8),
      secondary: Color(0xffe7bdba),
      onSecondary: Color(0xff442928),
      secondaryContainer: Color(0xff5d3f3e),
      onSecondaryContainer: Color(0xffffdad8),
      tertiary: Color(0xffe3c28c),
      onTertiary: Color(0xff412d05),
      tertiaryContainer: Color(0xff5a4319),
      onTertiaryContainer: Color(0xffffdea9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1111),
      onSurface: Color(0xfff0dedd),
      onSurfaceVariant: Color(0xffd7c1c0),
      outline: Color(0xffa08c8b),
      outlineVariant: Color(0xff534342),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedd),
      inversePrimary: Color(0xff904a48),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff3b080a),
      primaryFixedDim: Color(0xffffb3b0),
      onPrimaryFixedVariant: Color(0xff733332),
      secondaryFixed: Color(0xffffdad8),
      onSecondaryFixed: Color(0xff2c1514),
      secondaryFixedDim: Color(0xffe7bdba),
      onSecondaryFixedVariant: Color(0xff5d3f3e),
      tertiaryFixed: Color(0xffffdea9),
      onTertiaryFixed: Color(0xff271900),
      tertiaryFixedDim: Color(0xffe3c28c),
      onTertiaryFixedVariant: Color(0xff5a4319),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff423736),
      surfaceContainerLowest: Color(0xff140c0c),
      surfaceContainerLow: Color(0xff231919),
      surfaceContainer: Color(0xff271d1d),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3232),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb9b6),
      surfaceTint: Color(0xffffb3b0),
      onPrimary: Color(0xff330406),
      primaryContainer: Color(0xffcb7a78),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffebc1be),
      onSecondary: Color(0xff26100f),
      secondaryContainer: Color(0xffad8886),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe7c690),
      onTertiary: Color(0xff201400),
      tertiaryContainer: Color(0xffaa8c5c),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1111),
      onSurface: Color(0xfffff9f9),
      onSurfaceVariant: Color(0xffdcc6c4),
      outline: Color(0xffb39e9d),
      outlineVariant: Color(0xff927f7e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedd),
      inversePrimary: Color(0xff743433),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff2c0103),
      primaryFixedDim: Color(0xffffb3b0),
      onPrimaryFixedVariant: Color(0xff5e2323),
      secondaryFixed: Color(0xffffdad8),
      onSecondaryFixed: Color(0xff200b0a),
      secondaryFixedDim: Color(0xffe7bdba),
      onSecondaryFixedVariant: Color(0xff4b2f2e),
      tertiaryFixed: Color(0xffffdea9),
      onTertiaryFixed: Color(0xff1a0f00),
      tertiaryFixedDim: Color(0xffe3c28c),
      onTertiaryFixedVariant: Color(0xff47330a),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff423736),
      surfaceContainerLowest: Color(0xff140c0c),
      surfaceContainerLow: Color(0xff231919),
      surfaceContainer: Color(0xff271d1d),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3232),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xffffb3b0),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb9b6),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffebc1be),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe7c690),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1111),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f9),
      outline: Color(0xffdcc6c4),
      outlineVariant: Color(0xffdcc6c4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedd),
      inversePrimary: Color(0xff4e1718),
      primaryFixed: Color(0xffffe0de),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb9b6),
      onPrimaryFixedVariant: Color(0xff330406),
      secondaryFixed: Color(0xffffe0de),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffebc1be),
      onSecondaryFixedVariant: Color(0xff26100f),
      tertiaryFixed: Color(0xffffe3b8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe7c690),
      onTertiaryFixedVariant: Color(0xff201400),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff423736),
      surfaceContainerLowest: Color(0xff140c0c),
      surfaceContainerLow: Color(0xff231919),
      surfaceContainer: Color(0xff271d1d),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3232),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
