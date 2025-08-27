import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static initDio() {
    dio ??= Dio(BaseOptions(
        baseUrl: "",
        receiveDataWhenStatusError: true));
    dio!.interceptors.add(PrettyDioLogger());
  }

  static getRequest(
      {required String path, required Map<String, dynamic> data}) async {
    try {
      Response response = await dio!.get(path, queryParameters: data);
      return response;
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }

  static postRequest(
      {required String path, required Map<String, dynamic> data}) async {
    try {
      Response response = await dio!.post(path, data: data);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
