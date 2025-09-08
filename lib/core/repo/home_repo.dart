import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:implement_clean_code_for_store/core/networking/dio_helper.dart';
import 'package:implement_clean_code_for_store/core/networking/end_ponits.dart';
import 'package:implement_clean_code_for_store/features/models/product_model.dart';

class HomeRepo{
  final DioHelper _dioHelper;
  HomeRepo(this._dioHelper);
  
 Future<Either<String,List<ProductModel>>>getAllProducts()async{
    try {
      final Response response = await _dioHelper.getRequest(
          path: EndPoints.allProducts, data: {});
      if (response.statusCode == 200) {
        final allProducts = List<ProductModel>.from(
            (response.data as List).map((product) =>
                ProductModel.fromJson(product)));
        return Right(allProducts);
      }
      else{
        return Left(response.data.toString());
      }
    }on DioException catch(e){
      return Left(e.response?.data.toString()??e.toString());
    }
    catch (e){
      return Left(e.toString());
    }


  }
  
  
  
  
  
}