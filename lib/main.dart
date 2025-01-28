import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:test/core/constants/app_themes.dart';
import 'package:test/core/utils/helpers/bloc_observer.dart';
import 'package:test/core/utils/helpers/dioHelper.dart';
import 'package:test/core/utils/helpers/hive_helper.dart';
import 'package:test/my_app.dart';
import 'package:test/view/screens/complete_data/screens/complete_data_screen.dart';
import 'package:test/view/screens/home/screens/home_screen.dart';
import 'package:test/view/screens/login/login_screen.dart';

Future<Widget> getHomeWidget() async {
  late Widget homeWidget;

  bool isLoggedIn = HiveHelper.isLogged;
  log('==>> ${HiveHelper.getUserToken}');
  if (isLoggedIn) {
    if (HiveHelper.getUserName.isEmpty) {
      homeWidget = CompleteDataScreen();
    } else {
      homeWidget = HomeScreen();
    }
  } else {
    homeWidget = LoginScreen();
  }

  return homeWidget;
}

ValueNotifier<ThemeData> themeNotifier = ValueNotifier(AppThemes.lightTheme);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  await HiveHelper.init();

  await ScreenUtil.ensureScreenSize();
  await DioHelper.init();
  configLoading();

  Bloc.observer = MyBlocObserver();

  final Widget homeWidget = await getHomeWidget();

  runApp(EasyLocalization(
      path: 'assets/translation',
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
      fallbackLocale: const Locale('ar', 'EG'),
      startLocale: const Locale('ar', 'EG'),
      // fallbackLocale: const Locale('en', 'US'),
      child: MyApp(
        homeWidget: homeWidget,
      )));
}
