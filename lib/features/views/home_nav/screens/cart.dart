import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_assets.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_colors.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_text_styles.dart';
import 'package:implement_clean_code_for_store/features/controllers/cart_cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if(state is CartLoading){
            return CircularProgressIndicator();
          }
          if(state is CartSuccess){
            return Column(
              children: [
                Row(
                  spacing: 90,
                  children: [
                    BackButton(),
                    Text(
                      "My Cart",
                      style: AppStyles.textStyle16Black,
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 15,),
                      itemCount: state.model.length,
                      itemBuilder: (context, index) => CartItem(
                        title: state.model[index].products![index].quantity.toString(),
                      )
                  ),
                )


              ],
            );
          }
         return Text("data isnot  here");

        },
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.greyColor)
      ),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: Image.asset(
              AppAssets.shoes,
              width: 80,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  // spacing: 70,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "shoes",
                      style: AppStyles.textStyle16Black,
                    ),
                    // Spacer(),

                    Icon(Icons.delete, color: Colors.red,),


                  ],
                ),
                Text("size L", style: AppStyles.textStyle16Grey),
                SizedBox(height: 20,),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      Text(r"$1190", style: AppStyles.textStyle16Black),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start
                        ,
                        mainAxisAlignment: MainAxisAlignment.start,

                        spacing: 10,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(height: 20, width: 20, decoration:
                          BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColors.greyColor,
                              )
                          ), child: Icon(Icons.remove, size: 16,),),
                          Text(title),
                          Container(height: 20, width: 20, decoration:
                          BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColors.greyColor,
                              )),
                            child: Icon(Icons.add, size: 16),),
                        ],)
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Spacer(),

          // Column(
          //   crossAxisAlignment:CrossAxisAlignment.start
          //   ,mainAxisAlignment: MainAxisAlignment.start,
          //   spacing: 12,
          //   children: [
          //
          //   ],),

        ],),
    );
  }
}
