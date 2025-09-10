import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:implement_clean_code_for_store/core/networking/end_ponits.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
   Dio? dio;
DioHelper(){initDio();}
   initDio() {
    dio ??= Dio(BaseOptions(
      validateStatus: (status) => true,
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true));
    dio!.interceptors.add(PrettyDioLogger());
  }

   getRequest(
      {required String path,  Map<String, dynamic>? data}) async {
    try {
      Response response = await dio!.get(path, queryParameters: data);
      return response;
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }
    postRequest(
       {required String path, required Map<String, dynamic> data}) async {
     try {
       Response response = await dio!.post(path, data: data);
       return response;
     } catch (e) {
       rethrow;
     }

  }
}
