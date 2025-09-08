part of 'product_cubit.dart';

class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductState {}
final class ProductSuccess extends
ProductState {
  final List<ProductModel> model;
  ProductSuccess(this.model);
}

final class ProductFailure extends ProductState {
  final String errMsg;
  ProductFailure(this.errMsg);

}
