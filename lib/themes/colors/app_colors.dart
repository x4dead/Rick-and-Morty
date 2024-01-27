import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color color0B1E2D = Color(0xff0B1E2D);
  static const Color color43D049 = Color(0xff43D049);
  static const Color color152A3A = Color(0xff152A3A);
  static const Color color5B6975 = Color(0xff5B6975);
  static const Color colorFFFFFF = Color(0xffFFFFFF);
  static const Color color6E798C = Color(0xff6E798C);
  static const Color colorEB5757 = Color(0xffEB5757);
  static const Color color22A2BD = Color(0xff22A2BD);
  static const Color colorTransparent = Colors.transparent;
  static const LinearGradient characterBackGradient = LinearGradient(
    transform: GradientRotation(90),
    colors: [
      Color(0xFF000000),
      Color(0x0B1E2D00),
      Color(0x0B1E2D00),
    ],
  );
  // static const Color colorGreenAccent = Colors.greenAccent;
  // static const Color colorFFFF = Color.fromARGB(255, 207, 207, 207);
}
