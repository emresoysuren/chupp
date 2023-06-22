import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Store All The Text Styles Here
class Styles {
  final AppTheme theme;

  Styles({required this.theme});

  TextStyle get appTitle => GoogleFonts.ubuntu(
        color: theme.current.appTitle,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );

  TextStyle get title => GoogleFonts.ubuntu(
        color: theme.current.title,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );

  TextStyle get title2 => GoogleFonts.ubuntu(
        color: theme.current.title,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  TextStyle get title3 => GoogleFonts.ubuntu(
        color: theme.current.title,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  TextStyle get text => GoogleFonts.ubuntu(
        color: theme.current.text,
        fontSize: 16,
      );

  TextStyle get textImp => GoogleFonts.ubuntu(
        color: theme.current.text,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  TextStyle get itemText => GoogleFonts.ubuntu(
        color: theme.current.itemText,
        fontSize: 16,
      );

  TextStyle get itemTextImp => GoogleFonts.ubuntu(
        color: theme.current.itemText,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  TextStyle get subText => GoogleFonts.ubuntu(
        color: theme.current.subText,
        fontSize: 16,
      );

  TextStyle get itemSubText => GoogleFonts.ubuntu(
        color: theme.current.subText,
        fontSize: 16,
      );
}
