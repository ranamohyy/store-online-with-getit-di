import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:implement_clean_code_for_store/core/networking/dio_helper.dart';
import 'package:implement_clean_code_for_store/core/networking/end_ponits.dart';
import 'package:implement_clean_code_for_store/features/models/user_model.dart';

class AuthRepo {
  Future<Either<String, UserModel>> login(
      {required String userName, required String password}) async {
    final Response response =
        await DioHelper.postRequest(path: EndPoints.login, data: {
      "username": userName,
      "password": password,
    });
    try {
      if (response.statusCode == 200) {
        UserModel userModel = UserModel();
        return Right(userModel);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      if(e is DioException){
        return Left(e.response.toString());
      }
      return Left(e.toString());
    }
  }
}
