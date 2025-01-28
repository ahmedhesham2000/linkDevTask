import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/controller/auth_cubit/auth_cubit.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/view/screens/complete_data/widgets/data_field_widget.dart';
import 'package:test/view/screens/complete_data/widgets/gender_selection_widget.dart';
import 'package:test/view/screens/complete_data/widgets/saudi_cities_drop_down_widget.dart';
import 'package:test/view/screens/home/screens/home_screen.dart';

class CompleteDataScreen extends StatelessWidget {
  CompleteDataScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is CompleteRegisterationSuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
          }
          if (state is CompleteRegisterationFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 92.h),
                  SvgPicture.asset('assets/images/logo.svg'),
                  SizedBox(height: 23.h),
                  Text(
                    'create_account'.tr(),
                    style: AppStyles.style60024(context: context),
                  ),
                  SizedBox(height: 32.h),
                  DataFieldWidget(
                    title: 'full_name'.tr(),
                    hint: 'enter_full_name'.tr(),
                    controller: cubit.fullNmaeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required_field'.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  DataFieldWidget(
                    title: "${'email'.tr()} ${tr('optional')}",
                    hint: "${'enter_email'.tr()} ${"optional".tr()}",
                    controller: cubit.emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      }
                      final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                      if (!regex.hasMatch(value)) {
                        return 'enter_valid_email'.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: context.locale.languageCode == 'ar'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'gender'.tr(),
                        style: AppStyles.style40014(
                          context: context,
                        ),
                      ),
                    ),
                  ),
                  GenderSelectionWidget(
                    onGenderSelected: (p0) => log(p0.toString()),
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: context.locale.languageCode == 'ar'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'city'.tr(),
                        style: AppStyles.style40014(
                          context: context,
                        ),
                      ),
                    ),
                  ),
                  SaudiCitiesDropdownWidget(),
                  SizedBox(height: 12.h),
                  Align(
                    alignment: context.locale.languageCode == 'ar'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          text: "${'by_creating_account'.tr()} ",
                          style: AppStyles.style40014(
                            context: context,
                          ),
                          children: [
                            TextSpan(
                              text: 'terms_conditions'.tr(),
                              style: AppStyles.styleBold14(
                                context: context,
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ]),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (cubit.selectedGender == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('select_gender'.tr()),
                              backgroundColor: AppColor.red,
                            ));
                            return;
                          }
                          cubit.completeRegisteration();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff002E5B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        minimumSize: Size(double.infinity, 64.h),
                      ),
                      child: Text(
                        'create_account'.tr(),
                        style: AppStyles.style70018(
                            context: context, color: Colors.white),
                      )),
                  SizedBox(height: 36.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
