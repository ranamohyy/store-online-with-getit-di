import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:implement_clean_code_for_store/core/networking/dio_helper.dart';
import 'package:implement_clean_code_for_store/core/networking/end_ponits.dart';
import 'package:implement_clean_code_for_store/features/models/cart_model.dart';

class CartRepo{
  final DioHelper _dioHelper;
  CartRepo(this._dioHelper);

  Future<Either<String,List<CartModel>>>getCart(id)async
  {
    try {
      final Response response = await _dioHelper.getRequest(
        path: "${EndPoints.getCart}$id",);
    if(response.statusCode==200){
      final cart=List<CartModel>.from((response.data as List).map((e)=>CartModel.fromJson(e)));
      return Right(cart);
    }
    else{
      return Left(response.data.toString());
    }
    }on DioException catch(e){
      return Left(e.response?.data.toString()??e.toString());
    }
    catch(e){
      return Left(e.toString());
    }

  }

  Future<Either<String,List<CartModel>>>addToCart()async
  {
    try {
      final Response response = await _dioHelper.getRequest(
        path: "carts",);
    if(response.statusCode==201||response.statusCode==200){
      final cart=List<CartModel>.from((response.data as List).
      map((e)=>CartModel.fromJson(e)));

      return Right(cart);

    }
    else{
      return Left(response.data.toString());
    }
    }on DioException catch(e){
      return Left(e.response?.data.toString()??e.toString());
    }
    catch(e){
      return Left(e.toString());
    }

  }











}