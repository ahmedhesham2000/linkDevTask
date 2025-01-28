import 'package:dio/dio.dart';
import 'package:test/core/utils/helpers/dioHelper.dart';

class HomeRepo {
  Future<Response> getSalonData() async {
    return await DioHelper.getDataAPI(
      url: 'salons',
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

  Future<Response> getServicesData() async {
    return await DioHelper.getDataAPI(
      url: 'services',
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

  Future<Response> getOneSalonData({int? id}) async {
    return await DioHelper.getDataAPI(
      url: 'salon-details/$id',
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
