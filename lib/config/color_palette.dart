import 'package:flutter/painting.dart';

/// Store All The Colors Here
///
/// Note: DO NOT store the values have specific usage here, like "primary, dark_background etc.".
class ColorPalette {
  ColorPalette._();

  static const Color red = Color(0xffE84855);
  static const Color orange = Color(0xffE26F4B);
  static const Color green = Color(0xff57E949);
  static const Color yellow = Color(0xffffff00);
  static const Color white = Color(0xffffffff);
  static const Color blue = Color(0xff574AE2);
  static const Color pink = Color(0xffA04BE3);
  static const Color offBlack = Color(0xff1f1f1f);
  static const Color offWhite = Color(0xffEDEDED);
  static const Color lightGrey = Color(0xffAAAAAA);
  static const Color grey = Color(0xff5A5A5A);
  static const Color black = Color(0xff000000);

  static const Gradient bluePink = LinearGradient(
    colors: [ColorPalette.blue, ColorPalette.pink],
  );

  static const Gradient orangeRed = LinearGradient(
    colors: [ColorPalette.orange, ColorPalette.red],
  );
}
