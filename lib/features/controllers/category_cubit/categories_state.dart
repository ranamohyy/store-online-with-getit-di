part of 'categories_cubit.dart';

abstract class CategoriesState {}

 class CategoriesInitial extends CategoriesState {}
 class CategoriesLoading extends CategoriesState {}
 class CategoriesSuccess extends CategoriesState {
 List<String>model;
 CategoriesSuccess(this.model);

 }
 class CategoriesFailure extends CategoriesState {
 final String msg;
 CategoriesFailure(this.msg);
 }
