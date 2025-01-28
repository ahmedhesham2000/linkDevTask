import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/app_themes.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/main.dart';
import 'package:test/model/salons_model.dart';

class SalonTileWidget extends StatelessWidget {
  const SalonTileWidget({super.key, required this.salon, required this.image});

  final SalonsModel salon;
  final String? image;
  String formatServices(List<String> services) {
    if (services.length >= 3) {
      return '${'includes_services'.tr()} (${services.take(3).join(' - ')})';
    } else {
      return '${'includes_services'.tr()} (${services.join(' - ')})';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 111.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.borderColorDark,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Container(
              width: 117.w,
              height: 101.h,
              decoration: BoxDecoration(
                  // color: AppColor.primary,
                  image: image == null
                      ? null
                      : DecorationImage(
                          image: AssetImage(image!),
                          fit: BoxFit.cover,
                        ),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    salon.name ?? '',
                    style: AppStyles.style60014(
                      context: context,
                    ),
                  ),
                  Text(
                    salon.desc ?? '',
                    style: AppStyles.style50010(
                      context: context,
                    ),
                  ),
                  Text(
                    formatServices(salon.services
                        .where((element) => element.name != null)
                        .map((e) => e.name!)
                        .toList()),
                    style: AppStyles.style50010(
                      context: context,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          Text(
                            '(${salon.countRate}) ${salon.rateAvg}',
                            style: AppStyles.style50010(
                              context: context,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: themeNotifier.value == AppThemes.darkTheme
                                ? AppColor.secondary
                                : AppColor.primary,
                            size: 16,
                          ),
                          Text(
                            '${salon.distance} ${'km'.tr()}',
                            style: AppStyles.style50010(
                              context: context,
                              color: themeNotifier.value == AppThemes.darkTheme
                                  ? AppColor.secondary
                                  : AppColor.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
