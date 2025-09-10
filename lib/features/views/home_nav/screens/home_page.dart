import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_assets.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_colors.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_field.dart';
import 'package:implement_clean_code_for_store/features/controllers/cart_cubit/cart_cubit.dart';
import 'package:implement_clean_code_for_store/features/controllers/category_cubit/categories_cubit.dart';
import 'package:implement_clean_code_for_store/features/views/product_details/view.dart';
import '../../../../core/di/get_it.dart';
import '../../../../core/helpers/app_text_styles.dart';
import '../../../controllers/products_cubit/product_cubit.dart';
part '../parts/top_view_home_page.dart';
part '../parts/all_products.dart';
part '../parts/all_categories.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProductCubit>()..getAllProducts(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..getCategories(),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Discover", style: AppStyles.textStyle32Black),
              SizedBox(
                height: 12,
              ),
              TopViewHomePage(),
              SizedBox(
                height: 16,
              ),
              SizedBox(height: 30, child: AllCategories()),
              Expanded(
                child:AllProducts()
              ),
            ]),
      ),
    );
  }
}
