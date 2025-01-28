import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/controller/auth_cubit/auth_cubit.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/view/screens/complete_data/screens/complete_data_screen.dart';
import 'package:test/view/screens/home/screens/home_screen.dart';
import 'package:test/view/screens/otp_screen/widgets/pinput_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? timer;
  int secondsRemaining = 60;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String get timerText {
    int minutes = secondsRemaining ~/ 60;
    int seconds = secondsRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is OtpCheckSuccess) {
            if (cubit.userModel?.firstLogin == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompleteDataScreen()));
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false,
              );
            }
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 92.h),
                SvgPicture.asset('assets/images/logo.svg'),
                SizedBox(height: 23.h),
                Text(
                  'otp_check'.tr(),
                  style: AppStyles.style60024(context: context),
                ),
                SizedBox(height: 48.h),
                Align(
                  alignment: context.locale.languageCode == 'ar'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'otp_check_desc'.tr(),
                      style: AppStyles.style40014(
                        context: context,
                      ),
                      children: [
                        TextSpan(
                          text: context.locale.languageCode == 'ar'
                              ? ' ${cubit.phoneNumber} 966+ '
                              : '+966 ${cubit.formatNumber(cubit.phoneNumber)}',
                          style: AppStyles.styleBold14(
                            context: context,
                          ),
                        ),
                        TextSpan(
                          text: 'edit'.tr(),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              cubit.pinController.clear();
                              Navigator.pop(context);
                            },
                          style: AppStyles.styleBold14(
                            context: context,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                PinputField(),
                SizedBox(height: 16.h),
                Align(
                  alignment: context.locale.languageCode == 'ar'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'didnt_receive_code'.tr(),
                      style: AppStyles.style40014(
                        context: context,
                      ),
                      children: [
                        TextSpan(
                          text: secondsRemaining > 0
                              ? ' $timerText'
                              : " ${'resend_code'.tr()}",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              if (secondsRemaining == 0) {
                                cubit.login(cubit.phoneNumber);
                                setState(() {
                                  secondsRemaining = 60;
                                  timer = Timer.periodic(Duration(seconds: 1),
                                      (timer) {
                                    setState(() {
                                      if (secondsRemaining > 0) {
                                        secondsRemaining--;
                                      } else {
                                        timer.cancel();
                                      }
                                    });
                                  });
                                });
                              }
                            },
                          style: AppStyles.styleBold14(
                            context: context,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      cubit.otpCheck(code: cubit.pinController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff002E5B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: Size(double.infinity, 64.h),
                    ),
                    child: Text(
                      'check_now'.tr(),
                      style: AppStyles.style70018(
                          context: context, color: Colors.white),
                    )),
                SizedBox(height: 36.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
