import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test/core/utils/helpers/dioHelper.dart';
import 'package:test/core/utils/helpers/hive_helper.dart';
import 'package:test/model/login_model.dart';
import 'package:test/model/user_model.dart';
import 'package:test/repo/auth_repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  AuthRepo authRepo = AuthRepo();

  LoginModel? loginModel;

  String phoneNumber = '';

  UserModel? userModel;
  String? token;

  String formatNumber(String number) {
    // if (number.startsWith('0')) {
    //   number = number.substring(1); // Remove leading 0
    // }
    return '${number.substring(0, 2)} ${number.substring(2, 5)} ${number.substring(5)}';
  }

  TextEditingController pinController = TextEditingController();
  TextEditingController fullNmaeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? selectedGender;

  void login(String phone) async {
    EasyLoading.show();
    emit(LoginLoading());
    try {
      var response = await authRepo.login(phone);
      loginModel = LoginModel.fromMap(response.data);
      phoneNumber = phone;
      fullNmaeController.clear();
      emailController.clear();
      selectedGender = null;
      token = null;
      pinController.clear();

      EasyLoading.dismiss();
      emit(LoginSuccess());
    } catch (e) {
      EasyLoading.dismiss();
      if (e is DioException) {
        emit(LoginFailed(
          e.response?.data['message'],
        ));
      } else {
        emit(LoginFailed(
          'An unexpected error occurred',
        ));
      }
    }
  }

  void otpCheck({required String code}) async {
    emit(OtpCheckLoading());
    EasyLoading.show();
    await authRepo.otpCheck(phoneNumber, code).then((value) {
      userModel = UserModel.fromMap(value.data['data']);
      token = userModel!.token;

      DioHelper.setHeaderToken(token: token);
      EasyLoading.dismiss();

      emit(OtpCheckSuccess());
    }).catchError((error) {
      EasyLoading.dismiss();
      emit(OtpCheckFailed(error.response.data['message']));
    });
  }

  void completeRegisteration() async {
    emit(CompleteRegisterationLoading());
    await authRepo
        .completeRegisteration(
      fullName: fullNmaeController.text,
      email: emailController.text,
      gender: selectedGender,
      token: token,
    )
        .then((value) async {
      userModel = UserModel.fromMap(value.data['data']);
      await HiveHelper.cacheUserInfo(token: token!, userModel: userModel!);

      DioHelper.setHeaderToken(token: token!);
      log(HiveHelper.getUser?.avatar?.toString() ?? 'No avatar');
      emit(CompleteRegisterationSuccess());
    }).catchError((error) {
      emit(CompleteRegisterationFailed(error.response.data['message']));
    });
  }

  void logout() async {
    EasyLoading.show();
    emit(LogoutLoading());
    await authRepo.logout().then((value) async {
      await HiveHelper.logout();
      pinController.clear();
      fullNmaeController.clear();
      emailController.clear();
      selectedGender = null;
      userModel = null;
      token = null;
      EasyLoading.dismiss();
      emit(LogoutSuccess());
    }).catchError((error) {
      EasyLoading.dismiss();

      emit(LogoutFailed(error.response.data['message']));
    });
  }
}
