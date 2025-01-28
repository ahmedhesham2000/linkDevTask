import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:test/controller/auth_cubit/auth_cubit.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/app_themes.dart';
import 'package:test/main.dart';

class PinputField extends StatelessWidget {
  final String? ischeck;

  const PinputField({super.key, this.ischeck});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is OtpCheckFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        final defaultPinTheme = PinTheme(
          width: 70,
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: themeNotifier.value == AppThemes.darkTheme
                  ? Colors.white
                  : const Color(0xFF171717)),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: themeNotifier.value == AppThemes.lightTheme
                  ? Colors.white
                  : Colors.transparent),
        );
        final focusedPinTheme = defaultPinTheme.copyDecorationWith(
          border: Border.all(
              color: themeNotifier.value == AppThemes.darkTheme
                  ? AppColor.secondary
                  : const Color(0xFFA2A3A3)),
          borderRadius: BorderRadius.circular(10),
        );
        final successPinTheme = defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: AppColor.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
        );
        final errorPinTheme = defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
        );
        PinTheme currentPinTheme;
        if (ischeck == 'true') {
          currentPinTheme = successPinTheme;
        } else if (ischeck == 'false') {
          currentPinTheme = errorPinTheme;
        } else {
          currentPinTheme = defaultPinTheme;
        }

        return Center(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              autofocus: true,
              controller: cubit.pinController,
              defaultPinTheme: currentPinTheme, // Apply dynamic theme
              focusedPinTheme: focusedPinTheme,
              errorPinTheme: errorPinTheme,
              length: 4,
              cursor: Container(
                width: 1,
                height: 30,
                color: themeNotifier.value == AppThemes.lightTheme
                    ? Colors.black
                    : AppColor.secondary,
              ),
              hapticFeedbackType: HapticFeedbackType.heavyImpact,
              onChanged: (value) {
                if (ischeck != null) {
                  currentPinTheme = defaultPinTheme;
                }
              },
              onCompleted: (String verificationCode) {},
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
            ),
          ),
        );
      },
    );
  }
}
