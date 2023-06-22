import 'package:chupp/config/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../model/app_theme.dart';

class AppThemes {
  static AppThemeModel get system =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? AppThemes.dark
          : AppThemes.light;

  static AppThemeModel get light => AppThemeModel(
        primaryBg: ColorPalette.white,
        secondaryBg: ColorPalette.offWhite,
        primaryItem: ColorPalette.black,
        secondaryItem: ColorPalette.grey,
        appTitle: ColorPalette.blue,
        title: ColorPalette.black,
        itemTitle: ColorPalette.white,
        text: ColorPalette.black,
        itemText: ColorPalette.white,

        // Color can change if you think it should change
        subText: ColorPalette.offBlack,
        itemSubText: ColorPalette.lightGrey,
        important: ColorPalette.red,
        notice: ColorPalette.blue,
      );

  static AppThemeModel get dark => AppThemeModel(
        primaryBg: ColorPalette.black,
        secondaryBg: ColorPalette.offBlack,
        primaryItem: ColorPalette.white,
        secondaryItem: ColorPalette.grey,
        appTitle: ColorPalette.blue,
        title: ColorPalette.white,
        itemTitle: ColorPalette.black,
        text: ColorPalette.white,
        itemText: ColorPalette.black,
        subText: ColorPalette.lightGrey,

        // Color can change if you think it should change
        itemSubText: ColorPalette.offBlack,
        important: ColorPalette.red,
        notice: ColorPalette.yellow,
      );
}
