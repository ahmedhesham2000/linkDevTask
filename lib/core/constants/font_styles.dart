import 'package:flutter/material.dart';

import 'font_size.dart';

class AppStyles {
  static TextStyle style70040(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 40),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style50018(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style60018(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style60024(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold20(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style90020(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle style50020(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style70016(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration,
      TextDecoration? textDecoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Cairo',
      decoration: decoration, decorationColor: color ?? Colors.black,

      fontWeight: FontWeight.w700,
      // decorationColor: textDecoration == null ? null : color,
      decorationThickness: textDecoration == null ? null : 2,
    );
  }

  static TextStyle style70018(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style70020(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold18(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle styleBold16(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle style60016(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style50015(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style50016(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style50010(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style50014(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style50012(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style40016(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold14(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? (isDarkMode ? Colors.white : Colors.black),
      
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle styleSemiBold14(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style70014(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleRegular14(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style70013(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style60013(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style40013(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style40014(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style20014(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle style10014(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle style60012(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style60014(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold10(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold12(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleRegular12(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style60011(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style70011(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style60010(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style4008(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 8),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style40010(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style40012(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style3008(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 8),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle style30010(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle style10010(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle style30012(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle style30014(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle style40011(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular18(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular20(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular22(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold26(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 26),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style50026(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 26),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style70024(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold80(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 80),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold30(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium32(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style70032(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold60(
      {required BuildContext context,
      Color? color,
      TextDecoration? decoration}) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: getResponsiveFontSize(context, fontSize: 60),
      fontFamily: 'Cairo',
      decoration: decoration,
      decorationColor: color ?? Colors.black,
      fontWeight: FontWeight.w700,
    );
  }
}
