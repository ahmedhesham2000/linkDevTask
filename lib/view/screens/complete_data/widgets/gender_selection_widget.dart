import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test/controller/auth_cubit/auth_cubit.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/font_styles.dart';

class GenderSelectionWidget extends StatefulWidget {
  final Function(String?) onGenderSelected;

  const GenderSelectionWidget({super.key, required this.onGenderSelected});

  @override
  State<GenderSelectionWidget> createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio<String>(
              value: "male",
              groupValue: _selectedGender,
              activeColor: Color(0xFF0065A3),
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                  widget.onGenderSelected(value);
                  cubit.selectedGender = value;
                });
              },
            ),
            Text("male".tr(),
                style: AppStyles.style50014(
                    context: context, color: AppColor.darkGrey)),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: "female",
              groupValue: _selectedGender,
              activeColor: Color(0xFF0065A3),
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                  widget.onGenderSelected(value);
                  cubit.selectedGender = value;
                });
              },
            ),
            Text("female".tr(),
                style: AppStyles.style50014(
                    context: context, color: AppColor.darkGrey)),
          ],
        ),
      ],
    );
  }
}
