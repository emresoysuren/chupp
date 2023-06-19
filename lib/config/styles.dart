import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Store All The Text Styles Here
class Styles {
  Styles._();

  // TODO: Can we do this without get?
  static TextStyle get appTitle => GoogleFonts.ubuntu(
        color: AppTheme.current.appTitle,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get title => GoogleFonts.ubuntu(
        color: AppTheme.current.title,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get text => GoogleFonts.ubuntu(
        color: AppTheme.current.text,
        fontSize: 16,
      );

  static TextStyle get textImp => GoogleFonts.ubuntu(
        color: AppTheme.current.text,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get itemText => GoogleFonts.ubuntu(
        color: AppTheme.current.itemText,
        fontSize: 16,
      );

  static TextStyle get itemTextImp => GoogleFonts.ubuntu(
        color: AppTheme.current.itemText,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get subText => GoogleFonts.ubuntu(
        color: AppTheme.current.subText,
        fontSize: 16,
      );

  static TextStyle get itemSubText => GoogleFonts.ubuntu(
        color: AppTheme.current.subText,
        fontSize: 16,
      );
}
