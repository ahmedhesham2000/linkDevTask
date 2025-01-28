import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/app_themes.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/main.dart';
import 'package:test/view/widgets/custom_tex_field_widget.dart';

class DataFieldWidget extends StatelessWidget {
  const DataFieldWidget(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller,
      this.validator});

  final String title, hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: context.locale.languageCode == 'ar'
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              text: title,
              style: AppStyles.style40014(
                context: context,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          hint: hint,
          borderColor: AppColor.greyColor,
          fillColor: themeNotifier.value == AppThemes.lightTheme
              ? null
              : Color(0xff272727),
          borderRadius: 12,
          controller: controller,
          validator: validator,
          hintStyle: AppStyles.style50012(
              context: context,
              color: themeNotifier.value == AppThemes.darkTheme
                  ? null
                  : AppColor.darkGrey),
          textStyle: AppStyles.style50012(
              context: context,
              color: themeNotifier.value == AppThemes.darkTheme
                  ? null
                  : AppColor.darkGrey),
        ),
      ],
    );
  }
}
