import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/controller/home_cubit/home_cubit.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/app_themes.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/main.dart';

class SelectionRow extends StatefulWidget {
  const SelectionRow({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<SelectionRow> createState() => _SelectionRowState();
}

class _SelectionRowState extends State<SelectionRow> {

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Item
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    cubit.selectedIndex = 0; 
                    widget.pageController.animateToPage(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  });
                },
                child: Column(
                  children: [
                    Text(
                      'services'.tr(),
                      style: AppStyles.style60016(
                        context: context,
                        color: cubit.selectedIndex == 0
                            ? AppColor.secondary
                            : themeNotifier.value == AppThemes.darkTheme
                                ? AppColor.backgroundLight
                                : Colors.black,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    if (cubit.selectedIndex == 0)
                      Container(
                          height: 3.h,
                          decoration: BoxDecoration(
                            color: AppColor.secondary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          )),
                  ],
                ),
              ),
            ),
            SizedBox(width: 30.w),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    cubit.selectedIndex = 1; 
                    widget.pageController.animateToPage(1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  });
                },
                child: Column(
                  children: [
                    Text(
                      'salon_workers'.tr(),
                      style: AppStyles.style60016(
                        context: context,
                        color: cubit.selectedIndex == 1
                            ? AppColor.secondary
                            : themeNotifier.value == AppThemes.darkTheme
                                ? AppColor.backgroundLight
                                : Colors.black,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    if (cubit.selectedIndex == 1)
                      Container(
                          height: 3.h,
                          decoration: BoxDecoration(
                            color: AppColor.secondary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
