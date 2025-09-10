
import"package:get_it/get_it.dart";
import "package:implement_clean_code_for_store/core/helpers/cache_helper.dart";
import "package:implement_clean_code_for_store/core/networking/dio_helper.dart";
import "package:implement_clean_code_for_store/core/repo/auth_repo.dart";
import "package:implement_clean_code_for_store/core/repo/cart_repo.dart";
import "package:implement_clean_code_for_store/core/repo/home_repo.dart";
import "package:implement_clean_code_for_store/features/controllers/cart_cubit/cart_cubit.dart";
import "package:implement_clean_code_for_store/features/controllers/category_cubit/categories_cubit.dart";
import "package:implement_clean_code_for_store/features/controllers/login_cubit/login_cubit.dart";

import "../../features/controllers/products_cubit/product_cubit.dart";
  final getIt = GetIt.instance;
 void setup() {
   getIt.registerLazySingleton(()=>CacheHelper());

   DioHelper dio=DioHelper();
    getIt.registerSingleton<DioHelper>((dio));
    //repos
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()),);
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()),);
    getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()),);

    //cubit
    getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()),);
    getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt()));
    getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
    getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));

}