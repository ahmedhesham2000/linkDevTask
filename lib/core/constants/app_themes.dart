import 'package:flutter/material.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/utils/helpers/hive_helper.dart';

class AppThemes {
  final String? themeName = HiveHelper.getTheme;
  static final lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColor.primary,
    brightness: Brightness.light,
    dividerColor: Colors.white54,
    scaffoldBackgroundColor: AppColor.backgroundLight,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.backgroundLight,
      elevation: 0,
      centerTitle: false,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.primary,
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColor.primary,
    brightness: Brightness.dark,
    dividerColor: Colors.black54,
    scaffoldBackgroundColor: AppColor.backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.backgroundDark,
      centerTitle: false,
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
