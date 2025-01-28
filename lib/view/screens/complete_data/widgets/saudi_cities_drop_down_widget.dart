import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/font_styles.dart';

class SaudiCitiesDropdownWidget extends StatefulWidget {
  const SaudiCitiesDropdownWidget({super.key});

  @override
  State<SaudiCitiesDropdownWidget> createState() => _SaudiCitiesDropdownWidgetState();
}

class _SaudiCitiesDropdownWidgetState extends State<SaudiCitiesDropdownWidget> {
  // List of Saudi cities' keys (translation keys)
  final List<String> cityKeys = [
    "riyadh",
    "jeddah",
    "mecca",
    "medina",
    "dammam",
    "khobar",
    "abha",
    "tabuk",
    "taif",
    "hail",
    "najran",
    "jizan",
    "yanbu",
    "al_baha",
    "jubail",
    "qassim",
    "al_hufuf",
    "al_kharj",
    "sakaka",
    "arar"
  ];

  // Selected city
  String? selectedCityKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.greyColor),
      ),
      child: DropdownButton<String>(
        value: selectedCityKey,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        borderRadius: BorderRadius.circular(16),
        style: AppStyles.style50012(context: context, color: AppColor.darkGrey),
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down_outlined),
        underline: SizedBox(),
        iconSize: 24,
        hint: Text('choose_city'.tr()),
        items: cityKeys.map((key) {
          return DropdownMenuItem(
            value: key,
            child: Text(key.tr()), // Use Easy Localization
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedCityKey = value;
          });
        },
      ),
    );
  }
}
