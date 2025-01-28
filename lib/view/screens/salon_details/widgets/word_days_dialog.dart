import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/app_themes.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/main.dart';
import 'package:test/model/salon_model.dart';

class WorDayDialog extends StatelessWidget {
  const WorDayDialog({
    super.key,
    required this.salon,
  });

  final SalonModel salon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:
          Text('work_days'.tr(), style: AppStyles.style70020(context: context)),
      content: SizedBox(
        width: 350.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            ...salon.appointments.map((e) {
              return LectionRowWidget(
                day: e.dayAr ?? '',
                // time: ' ${e.fromTime} - ${e.toTime}',
                fromTime: e.fromTime ?? '',
                toTime: e.toTime ?? '',
              );
            }),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('close'.tr(),
              style: AppStyles.style50014(
                context: context,
                color: themeNotifier.value == AppThemes.darkTheme
                    ? AppColor.backgroundLight
                    : AppColor.secondary,
              )),
        ),
      ],
    );
  }
}

class LectionRowWidget extends StatelessWidget {
  const LectionRowWidget(
      {super.key,
      required this.day,
      required this.fromTime,
      required this.toTime});
  final String day;
  final String fromTime;
  final String toTime;

  String localizeTime(String time) {
    // Check and remove AM/PM
    String localizedTime = time
        .replaceAll(RegExp(r'\s?[aApP][mM]'), '') // Remove AM/PM
        .trim(); // Trim extra spaces

    // Manually add the localized AM/PM
    String amText = tr('am'); // Get localized "AM"
    String pmText = tr('pm'); // Get localized "PM"

    // Example: Adding based on logic (adjust as needed)
    if (time.toLowerCase().contains('am')) {
      localizedTime += ' $amText';
    } else if (time.toLowerCase().contains('pm')) {
      localizedTime += ' $pmText';
    }

    return localizedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: AppStyles.style50014(context: context),
        ),
        Text(
          '${localizeTime(fromTime)} - ${localizeTime(toTime)}',
          style: AppStyles.style50014(context: context),
        ),
      ],
    );
  }
}
