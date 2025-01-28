import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:test/controller/home_cubit/home_cubit.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/app_themes.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/main.dart';
import 'package:test/model/salon_model.dart';
import 'package:test/view/screens/salon_details/widgets/lection_row_widget.dart';
import 'package:test/view/screens/salon_details/widgets/services_page_view_widget.dart';
import 'package:test/view/screens/salon_details/widgets/word_days_dialog.dart';

class SalonDetailsTile extends StatelessWidget {
  const SalonDetailsTile({
    super.key,
    required this.salon,
    required this.controller,
  });

  final SalonModel salon;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return Container(
      decoration: BoxDecoration(
        color: themeNotifier.value == AppThemes.darkTheme
            ? Color(0xff191919)
            : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 35.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                salon.name ?? '',
                style: AppStyles.style70020(context: context),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColor.yellow,
                    size: 16,
                  ),
                  Text(
                    salon.rateAvg ?? '',
                    style: AppStyles.style50012(context: context),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                salon.desc ?? '',
                style: AppStyles.style50012(context: context),
              )),
            ],
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            children: [
              SvgPicture.asset('assets/icons/barber.svg'),
              SizedBox(
                width: 8.w,
              ),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: 'number_of_barbers'.tr(),
                    style: AppStyles.style50014(
                        context: context,
                        color: themeNotifier.value == AppThemes.darkTheme
                            ? Color(0xff00AEEF)
                            : Colors.black),
                  ),
                  TextSpan(
                    text: ' ${salon.countProvider} ',
                    style: AppStyles.style50014(context: context),
                  ),
                  TextSpan(
                    text: 'specialized_barbers'.tr(),
                    style: AppStyles.style50014(context: context),
                  ),
                ],
              )),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              SvgPicture.asset('assets/icons/clock.svg'),
              SizedBox(
                width: 8.w,
              ),
              RichText(
                  text: TextSpan(
                text: 'work_hours'.tr(),
                style: AppStyles.style50014(
                    context: context,
                    color: themeNotifier.value == AppThemes.darkTheme
                        ? Color(0xff00AEEF)
                        : Colors.black),
                children: [
                  TextSpan(
                    text: salon.isOpen ?? false
                        ? 'open_now'.tr()
                        : 'closed_now'.tr(),
                    style: AppStyles.style50014(
                        context: context,
                        color: salon.isOpen ?? false
                            ? AppColor.green
                            : AppColor.red,
                        decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                    text:
                        ' ${salon.isOpen ?? false ? salon.timeClose : salon.timeOpen} ',
                    style: AppStyles.style50014(context: context),
                  ),
                ],
              )),
              InkWell(
                onTap: () {
                  //shows dilaog contains the work hours
                  showDialog(
                    context: context,
                    builder: (context) => WorDayDialog(salon: salon),
                  );
                },
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  // size: 16,
                  color: themeNotifier.value == AppThemes.darkTheme
                      ? AppColor.backgroundLight
                      : AppColor.secondary,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('did_you_like_it'.tr(),
                  style: AppStyles.style60014(context: context)),
              ElevatedButton(
                  onPressed: () {
                    final link =
                        'https://gold-hamster-143901.hostingersite.com/salon/${salon.id}';
                    Share.share('${'share_text'.tr()} $link');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/share.svg'),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'share_with_friends'.tr(),
                        style: AppStyles.style70011(
                            context: context, color: Colors.white),
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 31.h,
          ),
          Container(
            height: 8.h,
            width: double.infinity,
            color: themeNotifier.value == AppThemes.darkTheme
                ? Color(0xff272727)
                : AppColor.lightGrey,
          ),
          SizedBox(
            height: 32.h,
          ),
          SelectionRow(
            pageController: controller,
          ),
          SizedBox(
            height: 24.h,
          ),
          ServicesPageViewWidget(
              controller: controller, cubit: cubit, salon: salon)
        ],
      ),
    );
  }
}
