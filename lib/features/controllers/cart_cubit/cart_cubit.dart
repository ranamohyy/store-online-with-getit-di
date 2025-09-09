import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implement_clean_code_for_store/core/repo/cart_repo.dart';
import 'package:implement_clean_code_for_store/features/models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitial());

  getCart(id) async {
    emit(CartLoading());
    final Either<String, List<CartModel>> response = await cartRepo.getCart(id);
    response.fold(
      (error) {
        emit(CartFailure());
      },
      (r) {
        emit(CartSuccess(r));
      },
    );
  }
  addToCart() async {
    emit(addCartLoading());
    final Either<String, List<CartModel>> response = await
    cartRepo.addToCart();
    response.fold(
      (error) {
        emit(addCartFailure());
      },
      (r) {
        emit(addCartSuccess());
      },
    );
  }
}
