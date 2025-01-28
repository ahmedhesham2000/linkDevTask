import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:test/core/utils/helpers/dioHelper.dart';
import 'package:test/model/user_model.dart';

class HiveHelper {
  static final Box _appBox = Hive.box('app_box');

  static Box get appBox => _appBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('app_box');
  }

  static Future<void> write({
    required String key,
    required dynamic value,
  }) async =>
      await _appBox.put(key, value);
  static dynamic read({required String key}) async => await _appBox.get(key);

  static bool hasData({required String key}) => _appBox.containsKey(key);

//==== OnBoarding Caching Methods ====
  static Future<void> checkOnBoardingComplete() async =>
      await write(key: 'onBoarding', value: true);

  static Future<bool> getOnBoardingValue() async {
    bool isOnBoardingChecked = false;
    if (hasData(key: 'onBoarding')) {
      isOnBoardingChecked = await read(key: 'onBoarding');
    }
    return isOnBoardingChecked;
  }

  //==== User Caching Methods ====
  static Future<void> cacheUserInfo({
    required String token,
    required UserModel userModel,
  }) async {
    await cacheUserToken(token: token);
    await cacheUserModel(userModel: userModel);
  }

  static String get getUserName {
    if (_appBox.containsKey('userModel')) {
      String name = getUser!.name ?? '';
      return name;
    }
    return '';
  }

  static String get getEmail {
    if (_appBox.containsKey('userModel')) {
      String email = getUser!.email ?? '';
      return email;
    }
    return '';
  }

  static Future<void> cacheUserToken({required String token}) async {
    await _appBox.put('token', token);
    log('user token cached');
  }

  static String? get getUserToken => _appBox.get('token');
  static bool get isLogged => getUserToken != null;

  static Future<void> cacheUserModel({required UserModel userModel}) async {
    await _appBox.put('userModel', userModel.toMap());
    log('user model cached');
  }

  static UserModel? get getUser {
    UserModel? userModel;
    if (_appBox.containsKey('userModel')) {
      try {
        log('user model exists');
        var data = _appBox.get('userModel');
        userModel = UserModel(
          email: data['email'],
          avatar: data['avatar'],
          cityId: data['cityId'],
          cityName: data['cityName'],
          name: data['name'],
          id: data['id'],
          phone: data['phone'],
          gender: data['gender'],
        );
      } catch (e) {
        log('=>$e');
      }
    } else {
      log('user model not exists');
    }
    return userModel;
  }

  static Future<void> logout() async {
    if (DioHelper.dio != null) {
      // DioHelper.resetHeaderToken();
    }
    await _appBox.deleteAll([
      'userModel',
      'token',
    ]);
  }
  static String? get getTheme => _appBox.get('theme');

  static Future<void> cacheTheme({required String theme}) async {
    await _appBox.put('theme', theme);
    log('theme cached');
  }

  
}
