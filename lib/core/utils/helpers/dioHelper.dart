// ignore_for_file: file_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test/core/constants/global_constants.dart';
import 'package:test/core/utils/helpers/hive_helper.dart';

abstract class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://gold-hamster-143901.hostingersite.com/api/',
      receiveDataWhenStatusError: true,
      headers: {
        "Content-Type": 'application/json',
        'Accept': 'application/json',
      },
    ));
    dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }));
    if (Hive.isBoxOpen('app_box')) {
      setHeaderToken(token: HiveHelper.getUserToken);
    }
  }

  static void setHeaderToken({required String? token}) {
    log('|==|' * 22);
    log('token is $token');
    log('|==|' * 22);
    if (token != null) {
      dio!.options.headers["Authorization"] = token;
    }
  }

  static Future<Response> postDataAPI({
    required String url,
    Map<String, dynamic>? query,
    data,
    // String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': HiveHelper.getUserToken,
      'Accept-Language': lang,
      'api-key': '11223344'
    };

    return await dio!.post(url, data: data, queryParameters: query);
  }

  static Future<Response> postFromDataAPI({
    required String url,
    Map<String, dynamic>? query,
    // String lang = 'en',
    required Object data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': "Bearer $token",
      'Accept-Language': lang,
      'api-key': '11223344'
    };

    return await dio!.post(url, data: data, queryParameters: query);
  }

  static Future<Response> putDataAPI({
    required String url,
    Map<String, dynamic>? query,
    required Object data,
    // String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': "$token",
      'Accept-Language': lang,
      'api-key': '11223344'
    };

    return await dio!.put(url, data: data, queryParameters: query);
  }

  static Future<Response> patchDataAPI({
    required String url,
    Map<String, dynamic>? query,
    required Object data,
    // String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': "$token",
      'Accept-Language': lang,
      'api-key': '11223344'
    };

    return await dio!.patch(url, data: data, queryParameters: query);
  }

  static Future<Response> putFromDataAPI({
    required String url,
    Map<String, dynamic>? query,
    required Object data,
    // String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      // 'Content-Type': 'application/json',
      'Authorization': "$token",
      'Accept-Language': lang,
      'api-key': '11223344'
    };

    return await dio!.put(url, data: data, queryParameters: query);
  }

  static Future<Response> getDataAPI({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    // String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
      'Accept-Language': lang,
      'api-key': '11223344'
    };
    return await dio!.get(url, queryParameters: query, data: data);
  }

  static Future<Response> deleteDataAPI({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    // String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token',
      'Accept-Language': lang,
      'api-key': '11223344'
    };
    return await dio!.delete(url, queryParameters: query, data: data);
  }
}
