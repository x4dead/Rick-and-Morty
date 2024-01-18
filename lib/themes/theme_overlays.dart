import 'package:flutter/material.dart';

class CustomThemeOverlay extends ThemeExtension<CustomThemeOverlay> {
  final Color? colorError;
  final Color? color0B1E2D;
  final Color? colorGreen;
  final Color? color152A3A;
  final Color? color5B6975;
  final Color? colorFFFFFF;
  final Color? color6E798C;
  final Color? color22A2BD;
  // final Color colorOnPrimaryFixedVariant;
  // final Color colorSecondary;
  // final Color colorOnSecondary;
  // final Color colorSecondaryContainer;
  // final Color colorOnSecondaryContainer;
  // final Color colorSecondaryFixed;
  // final Color colorOnSecondaryFixed;
  // final Color colorSecondaryFixedDim;
  // final Color colorOnSecondaryFixedVariant;
  // final Color colorTertiary;
  // final Color colorOnTertiary;
  // final Color colorTertiaryContainer;
  // final Color colorOnTertiaryContainer;
  // final Color colorError;
  // final Color colorOnError;
  // final Color colorErrorContainer;
  // final Color colorOnErrorContainer;
  // final Color colorOutline;
  // final Color colorOnBackground;
  // final Color colorSurface;
  // final Color colorSurfaceVariant;
  // final Color colorOnSurface;
  // final Color colorOnSurfaceVariant;
  // final Color colorSurfaceInverse;
  // final Color colorOnSurfaceInverse;
  // final Color colorPrimaryInverse;
  // final Color colorOutlineVariant;
  // final Color colorSurfaceContainerHighest;
  // final Color colorSurfaceContainerHigh;
  // final Color colorSurfaceContainer;
  // final Color colorSurfaceContainerLow;
  // final Color colorSurfaceContainerLowest;
  // final Color colorSurfaceBright;
  // final Color colorSurfaceDim;
  CustomThemeOverlay({
    this.colorError,
    this.color0B1E2D,
    this.colorGreen,
    this.color152A3A,
    this.color5B6975,
    this.colorFFFFFF,
    this.color6E798C,
    this.color22A2BD,
  });

  @override
  ThemeExtension<CustomThemeOverlay> lerp(
      covariant ThemeExtension<CustomThemeOverlay>? other, double t) {
    if (other is! CustomThemeOverlay) {
      return this;
    }
    return CustomThemeOverlay();
  }

  @override
  CustomThemeOverlay copyWith({
    Color? colorError,
    Color? color0B1E2D,
    Color? color43D049,
    Color? color152A3A,
    Color? color5B6975,
    Color? colorFFFFFF,
    Color? color6E798C,
    Color? color22A2BD,
  }) {
    return CustomThemeOverlay(
      colorError: colorError ?? this.colorError,
      color0B1E2D: color0B1E2D ?? this.color0B1E2D,
      colorGreen: color43D049 ?? this.colorGreen,
      color152A3A: color152A3A ?? this.color152A3A,
      color5B6975: color5B6975 ?? this.color5B6975,
      colorFFFFFF: colorFFFFFF ?? this.colorFFFFFF,
      color6E798C: color6E798C ?? this.color6E798C,
      color22A2BD: color22A2BD ?? this.color22A2BD,
    );
  }
}
