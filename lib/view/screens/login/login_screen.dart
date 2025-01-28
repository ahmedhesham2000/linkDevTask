import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/controller/auth_cubit/auth_cubit.dart';
import 'package:test/core/constants/app_themes.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/main.dart';
import 'package:test/view/screens/login/widgets/phone_text_field_widget.dart';
import 'package:test/view/screens/otp_screen/screens/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidSaudiNumber(String phoneNumber) {
    final RegExp saudiNumberRegExp = RegExp(r'^05[0-9]{8}$');
    return saudiNumberRegExp.hasMatch(phoneNumber);
  }

  final _formKey = GlobalKey<FormState>();

  bool error = false;

  String? errorText;
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // cubit.otpCheck(code: '1234');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(),
              ));
        }
        if (state is LoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 92.h),
                SvgPicture.asset(themeNotifier.value == AppThemes.darkTheme
                    ? 'assets/images/logo_dark.svg'
                    : 'assets/images/logo.svg'),
                SizedBox(height: 23.h),
                Text(
                  'login'.tr(),
                  style: AppStyles.style60024(context: context),
                ),
                SizedBox(height: 48.h),
                Align(
                  alignment: context.locale.languageCode == 'ar'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    'phone'.tr(),
                    style: AppStyles.style50016(
                      context: context,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                PhoneNumberTextFieldWidget(
                  controller: phoneController,
                  formKey: _formKey,
                  fillColor: themeNotifier.value == AppThemes.darkTheme
                      ? Color(0xff272727)
                      : Colors.white,
                  error: error,
                  errorText: errorText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      error = true;
                      errorText = 'enter_phone'.tr();
                      return null;
                    } else if (!isValidSaudiNumber(value)) {
                      error = true;
                      errorText = 'enter_valid_phone'.tr();
                      return null;
                    } else {
                      error = false;
                      errorText = null;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 36.h),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {});

                        if (error) {
                          log('error');
                        } else {
                          cubit.login(phoneController.text);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff002E5B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: Size(double.infinity, 64.h),
                    ),
                    child: Text(
                      'login'.tr(),
                      style: AppStyles.style70018(
                          context: context, color: Colors.white),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
