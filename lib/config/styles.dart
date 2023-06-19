import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Store All The Text Styles Here
class Styles {
  Styles._();

  // TODO: Can we do this without get?
  static TextStyle get titleLoading => GoogleFonts.ubuntu(
        color: AppTheme.current.appTitle,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      );

  static TextStyle get text => GoogleFonts.ubuntu(
        color: AppTheme.current.text,
        fontSize: 16,
      );

  // TODO: Add styles For the headings
}
