import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/controller/auth_cubit/auth_cubit.dart';
import 'package:test/controller/home_cubit/home_cubit.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/app_themes.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/core/constants/global_constants.dart';
import 'package:test/core/utils/helpers/hive_helper.dart';
import 'package:test/main.dart';
import 'package:test/view/screens/login/login_screen.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      // padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(HiveHelper.getUser?.avatar ?? ""),
                ),
              ),
              Text(
                HiveHelper.getUserName,
                style: AppStyles.style50014(
                    context: context,
                    color: themeNotifier.value == AppThemes.darkTheme
                        ? AppColor.backgroundLight
                        : Color(0xff002E5B)),
              ),
              Text(
                HiveHelper.getEmail,
                style: AppStyles.style40010(
                    context: context,
                    color: themeNotifier.value == AppThemes.darkTheme
                        ? AppColor.backgroundLight
                        : AppColor.darkGrey),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () {
              context.locale == Locale('ar', 'EG')
                  ? context.setLocale(Locale('en', 'US'))
                  : context.setLocale(Locale('ar', 'EG'));
              lang = context.locale.languageCode;
              HomeCubit.get(context).getSalonData();
              // Navigator.pushNamed(context, '/profile');
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('language'.tr(),
                          style: AppStyles.style60012(
                            context: context,
                          )),
                      SizedBox(
                        width: 12.w,
                      ),
                      SvgPicture.asset(
                          themeNotifier.value == AppThemes.darkTheme
                              ? 'assets/icons/dark_language.svg'
                              : 'assets/icons/language.svg'),
                    ].reversed.toList(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: themeNotifier.value == AppThemes.darkTheme
                        ? AppColor.secondary
                        : Color(0xff002E5B),
                    size: 10,
                  ),
                ]),
          ),
        ),
        InkWell(
          onTap: () async {
            final String? theme = HiveHelper.getTheme;

            if (theme != null && theme == 'light' ||
                theme == null && themeNotifier.value == AppThemes.lightTheme) {
              await HiveHelper.cacheTheme(theme: 'dark');
              themeNotifier.value = AppThemes.darkTheme;
            } else {
              await HiveHelper.cacheTheme(theme: 'light');
              themeNotifier.value = AppThemes.lightTheme;
            }
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('theme'.tr(),
                          style: AppStyles.style60012(
                            context: context,
                          )),
                      SizedBox(
                        width: 12.w,
                      ),
                      SvgPicture.asset(
                          themeNotifier.value == AppThemes.darkTheme
                              ? 'assets/icons/dark_theme.svg'
                              : 'assets/icons/theme.svg'),
                    ].reversed.toList(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: themeNotifier.value == AppThemes.darkTheme
                        ? AppColor.secondary
                        : Color(0xff002E5B),
                    size: 10,
                  ),
                ]),
          ),
        ),
        Spacer(),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false);
            }
          },
          builder: (context, state) {
            return InkWell(
              onTap: () {
                AuthCubit.get(context).logout();
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/logout.svg'),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text('logout'.tr(),
                        style: AppStyles.style60014(
                          context: context,
                          color: AppColor.red,
                        )),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 80.h,
        ),
      ],
    ));
  }
}
