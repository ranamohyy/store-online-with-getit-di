import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_assets.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_colors.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_field.dart';
import 'package:implement_clean_code_for_store/features/models/product_model.dart';
import 'package:implement_clean_code_for_store/features/views/product_details/view.dart';
import '../../../../core/di/get_it.dart';
import '../../../../core/helpers/app_text_styles.dart';
import '../../../controllers/home_cubit/product_cubit.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()..getAllProducts(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40,
              ),
              Text("Discover", style: AppStyles.textStyle32Black),
              SizedBox(
                height: 16,
              ),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                      child: AppField(
                    hintText: "Search for clothes...",
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.boldGreyColor,
                    ),
                  )),
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primaryColor),
                    child: SvgPicture.asset(
                      AppAssets.settings,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor),
                      child: Center(
                          child: Text(
                        "All",
                        style: TextStyle(color: Colors.white),
                      )),
                    );
                  },
                ),
              ),
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                  if (state is ProductFailure) {
                    return Center(child: Text("No Data"));
                  }
                  if (state is ProductSuccess) {
                    return Expanded(
                      child: GridView.builder(
                        itemCount: state.model.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.8),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        model:
                                            state.model[index] as ProductModel),
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                        state.model[index].image ?? ""),
                                  ),
                                  Text(
                                    state.model[index].title ?? "Shoes",
                                    style: AppStyles.textStyle16Black,
                                  ),
                                  Text(
                                    r"$" + state.model[index].price.toString(),
                                    style: AppStyles.textStyle12Grey,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ]),
      ),
    );
  }
}
