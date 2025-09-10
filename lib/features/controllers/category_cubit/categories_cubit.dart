import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implement_clean_code_for_store/core/repo/home_repo.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  final HomeRepo homeRepo;
  getCategories() async {
    emit(CategoriesLoading());
    final Either<String, List<String>> response =
        await homeRepo.getAllCategories();
    response.fold(
      (error) {
        emit(CategoriesFailure(error));
      },
      (r) {
        emit(CategoriesSuccess(r));
      },
    );
  }
}
