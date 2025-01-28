import 'package:dio/dio.dart';
import 'package:test/core/utils/helpers/dioHelper.dart';

class AuthRepo {
  Future<Response> login(
    String phone,
  ) async {
    var data = FormData.fromMap({
      'phone': phone,
      'device_id': '1111111111111111',
      'token_firebase': 'mmmmmmmmmmmmmmmmaaaaaaaaaaaaaaaaaaa'
    });
    return await DioHelper.postFromDataAPI(url: 'login', data: data).then(
      (value) {
        return value;
      },
    ).catchError(
      (error) {
        throw error;
      },
    );
  }

  Future<Response> otpCheck(String phone, String code) async {
    var data = FormData.fromMap({
      'phone': phone,
      'code': code,
    });
    return await DioHelper.postFromDataAPI(url: 'active-code', data: data).then(
      (value) {
        return value;
      },
    ).catchError(
      (error) {
        throw error;
      },
    );
  }

  Future<Response> completeRegisteration(
      {String? fullName, String? email, String? gender, String? token}) async {
    var data = FormData.fromMap({
      'name': fullName,
      'email': email,
      'gender': gender,
      'city_id': '1',
    });
    return await DioHelper.postFromDataAPI(
            token: token, url: 'complete-registration', data: data)
        .then(
      (value) {
        return value;
      },
    ).catchError(
      (error) {
        throw error;
      },
    );
  }

  Future<Response> logout() async {
    return await DioHelper.getDataAPI(
      url: 'logout',
    ).then(
      (value) {
        return value;
      },
    ).catchError(
      (error) {
        throw error;
      },
    );
  }
}
