import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/core/constants/app_themes.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/main.dart';

class PhoneNumberTextFieldWidget extends StatelessWidget {
  const PhoneNumberTextFieldWidget({
    super.key,
    required this.controller,
    required this.formKey,
    required this.error,
    required this.validator,
    required this.errorText,
    this.fillColor,
  });

  final TextEditingController? controller;
  final GlobalKey? formKey;
  final bool error;
  final String? errorText;
  final Color? fillColor;
  final String? Function(String?)? validator;

  bool isValidSaudiNumber(String phoneNumber) {
    final RegExp saudiNumberRegExp = RegExp(r'^05[0-9]{8}$');
    return saudiNumberRegExp.hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 54.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
          decoration: BoxDecoration(
            color: themeNotifier.value == AppThemes.darkTheme
                ? fillColor
                : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: themeNotifier.value == AppThemes.darkTheme
                    ? Colors.transparent
                    : Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/saudi.svg',
                    width: 25.w,
                    height: 18.h,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '+966',
                    style: AppStyles.style50012(
                      context: context,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 14.w),
              Container(
                color: const Color(0xffD9D9D9),
                width: 1,
                height: 26,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    validator: validator,
                    controller: controller,
                    style: AppStyles.style50014(
                      context: context,
                    ),
                    decoration: InputDecoration(
                      hintText: '05xxxxxxx',
                      fillColor: fillColor,
                      filled: true,
                      counter: const SizedBox(
                        height: 0,
                        width: 0,
                      ),
                      labelStyle: AppStyles.style50014(
                          context: context, color: Colors.grey),
                      hintStyle: AppStyles.style50014(
                          context: context, color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (error)
          Align(
            alignment: context.locale.languageCode == 'ar'
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Text(
              errorText ?? '',
              style: AppStyles.style50012(context: context, color: Colors.red),
            ),
          ),
      ],
    );
  }
}
