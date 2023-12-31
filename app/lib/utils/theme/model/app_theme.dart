import 'package:flutter/material.dart';

class AppThemeModel {
  /// Primary Background Color
  final Color primaryBg;

  /// Secondary Background Color
  final Color secondaryBg;

  /// Background Color for the splash page
  final Color splashBg;

  /// Item Color for the splash page
  final Color splashItem;

  /// Primary Item Color
  final Color primaryItem;

  /// Secondary Item Color
  final Color secondaryItem;

  /// Primary Button Color
  final Color primaryBtn;

  /// Secondary Button Color
  final Color secondaryBtn;

  /// App Title Color
  final Color appTitle;

  /// Title Color for the background colors.
  final Color title;

  /// Title Color for the item colors.
  final Color itemTitle;

  /// Text Color for the background colors.
  final Color text;

  /// Text Color for the item colors.
  final Color itemText;

  /// Text Color for the primary button colors.
  final Color primaryBtnText;

  /// Text Color for the secondary button colors.
  final Color secondaryBtnText;

  /// Sub Text Color for the background colors.
  final Color subText;

  /// Sub Text Color for the item colors.
  final Color itemSubText;

  /// Color for important stuff
  final Color important;

  /// Color for not important but should be noticed
  final Color notice;

  /// Color to encourage the user
  final Color success;

  // Barrier Color
  final Color barrierColor;

  AppThemeModel({
    required this.primaryBg,
    required this.secondaryBg,
    required this.splashBg,
    required this.primaryItem,
    required this.secondaryItem,
    required this.primaryBtn,
    required this.secondaryBtn,
    required this.splashItem,
    required this.appTitle,
    required this.title,
    required this.itemTitle,
    required this.text,
    required this.itemText,
    required this.primaryBtnText,
    required this.secondaryBtnText,
    required this.subText,
    required this.itemSubText,
    required this.important,
    required this.notice,
    required this.success,
    required this.barrierColor,
  });
}
