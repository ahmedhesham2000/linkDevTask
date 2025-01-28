import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/controller/home_cubit/home_cubit.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/model/salon_model.dart';

class ServicesPageViewWidget extends StatelessWidget {
  const ServicesPageViewWidget({
    super.key,
    required this.controller,
    required this.cubit,
    required this.salon,
  });

  final PageController controller;
  final HomeCubit cubit;
  final SalonModel salon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 24.h,
            ),
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 181.w,
                  height: 146.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                      cubit.services[index].image ?? '',
                    )),
                    // color: AppColor.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Text(cubit.services[index].name ?? '',
                    style: AppStyles.style50014(context: context)),
              ],
            ),
            shrinkWrap: true,
            itemCount: cubit.services.length,
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => SizedBox(
              height: 24.h,
            ),
            itemBuilder: (context, index) => Container(
              width: double.infinity,
              height: 73.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffE0E0E0),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: Row(
                children: [
                  Container(
                    width: 94.w,
                    height: 61.h,
                    decoration: BoxDecoration(
                      // color: AppColor.primary,
                      image: DecorationImage(
                        image: NetworkImage(
                          salon.providers[index].avatar ?? '',
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(salon.providers[index].name ?? '',
                              style: AppStyles.style50014(context: context)),
                          // SizedBox(width: 150.w),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColor.yellow,
                                size: 16,
                              ),
                              Text(
                                salon.providers[index].rateAvg ?? '',
                                style: AppStyles.style50014(context: context),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(salon.providers[index].nationality ?? '',
                          style: AppStyles.style50014(context: context)),
                    ],
                  ),
                ],
              ),
            ),
            shrinkWrap: true,
            itemCount: salon.providers.length,
          ),
        ],
      ),
    );
  }
}
