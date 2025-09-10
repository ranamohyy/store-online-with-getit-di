import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implement_clean_code_for_store/core/repo/home_repo.dart';
import 'package:implement_clean_code_for_store/features/models/product_model.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.repo) : super(ProductInitial());
  HomeRepo repo;

  getAllProducts() async {
    emit(ProductLoading());
    final Either<String, List<ProductModel>> response =
        await repo.getAllProducts();

    response.fold(
      (error) {
        emit(ProductFailure(error));
      },
      (model) => emit(ProductSuccess(model)),
    );
  }

  getCategoryProduct(nameOfCategory) async {
    emit(ProductLoading());
    final Either<String, List<ProductModel>> response =
        await repo.getProductsCategories(nameOfCategory);
    response.fold(
      (error) {
        emit(ProductFailure(error));
      },
      (model) => emit(ProductSuccess(model)),
    );
  }
}
