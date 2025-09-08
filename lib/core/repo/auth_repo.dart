import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:implement_clean_code_for_store/core/helpers/cache_helper.dart';
import 'package:implement_clean_code_for_store/core/networking/dio_helper.dart';
import 'package:implement_clean_code_for_store/core/networking/end_ponits.dart';
import 'package:implement_clean_code_for_store/features/models/user_model.dart';

import '../di/get_it.dart';

class AuthRepo {
  final DioHelper _dioHelper;
  AuthRepo(this._dioHelper);
  Future<Either<String, UserModel>> login(
      {required String userName, required String password}) async {
    final Response response =
        await _dioHelper.postRequest(path: EndPoints.login, data: {
      "username": userName,
      "password": password,
    });
    try {
      if (response.statusCode == 200||response.statusCode==201) {
        UserModel userModel = UserModel.fromJson(response.data);
        if(userModel.token !=null){
          await getIt<CacheHelper>().saveToken(userModel.token!);
          return Right(userModel);
        }else{
          return Left("Token is Null");
        }
      } else {

        return Left(response.data.toString());
      }
    } catch (e) {
      if(e is DioException){
        return Left(e.response?.data.toString()??e.message??"error");
      }
      return Left(e.toString());
    }
  }
}
