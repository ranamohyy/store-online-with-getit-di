part of 'cart_cubit.dart';

abstract class CartState {}

 class CartInitial extends CartState {}
 class CartLoading extends CartState {}
 class CartSuccess extends CartState {
 List<CartModel>model;
 CartSuccess(this.model);

 }
 class CartFailure extends CartState {}
 class addCartFailure extends CartState {}
 class addCartSuccess extends CartState {}
 class addCartLoading extends CartState {}
