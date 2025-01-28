import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/model/salon_model.dart';
import 'package:test/view/screens/salon_details/widgets/salon_details_tile.dart';

class SalonDetailsScreen extends StatelessWidget {
  SalonDetailsScreen({super.key, required this.salon});
  final PageController controller = PageController();
  final SalonModel salon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/salon.png',
            ),
            Positioned(
              top: 50.h,
              right: context.locale.languageCode == 'en' ? null : 20.w,
              left: context.locale.languageCode == 'en' ? 20.w : null,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.arrow_back,
                    color: AppColor.darkGrey,
                  )),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 220.h,
              child: SalonDetailsTile(
                salon: salon,
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
