import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/controller/auth_cubit/auth_cubit.dart';
import 'package:test/controller/home_cubit/home_cubit.dart';
import 'package:test/core/constants/app_themes.dart';
import 'package:test/core/constants/global_constants.dart';
import 'package:test/core/utils/helpers/connectivity_manager.dart';
import 'package:test/core/utils/helpers/hive_helper.dart';
import 'package:test/main.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp({super.key, required this.homeWidget});

  Widget? homeWidget;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ConnectivityManager _connectivityManager = ConnectivityManager();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ConnectivityResult? connectivityResult;
  Future<void> _checkConnectivityFirstTime() async {
    _connectivityManager.checkConnectivity().then((result) {
      if (result != null) _updateConnectionStatus(result);
    });
  }

  void _updateConnectionStatus(ConnectivityResult result) async {
    log(result.toString());
    setState(() {
      connectivityResult = result;
    });
  }

  @override
  void initState() {
    _checkConnectivityFirstTime();
    _connectivitySubscription = _connectivityManager.onConnectivityChanged
        .listen(_updateConnectionStatus);
    getThemeData();
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void getThemeData() {
    final String? themeName = HiveHelper.getTheme;
    if (themeName == 'dark') {
      themeNotifier.value = AppThemes.darkTheme;
    } else {
      themeNotifier.value = AppThemes.lightTheme;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    lang = context.locale.languageCode;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getSalonData(),
        ),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(430, 923),
        builder: (_, __) {
          return ValueListenableBuilder<ThemeData>(
            valueListenable: themeNotifier,
            builder: (context, theme, child) {
              return MaterialApp(
                title: 'Link Development Task',
                debugShowCheckedModeBanner: false,
                locale: context.locale,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                theme: theme,
                home: widget.homeWidget,
                builder: (context, child) {
                  if (connectivityResult == ConnectivityResult.none &&
                      context.mounted) {
                    return const Scaffold(
                      body: Center(
                        child: Text("Please Check your connection"),
                      ),
                    );
                  }
                  return EasyLoading.init(
                    builder: (context, child) => MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: TextScaler.noScaling),
                      child: child ?? const Scaffold(),
                    ),
                  )(context, child);
                },
              );
            },
          );
        },
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = true
    ..backgroundColor = Colors.white
    ..textColor = Colors.white
    ..indicatorColor = Colors.black
    ..userInteractions = false
    ..dismissOnTap = false;
}
