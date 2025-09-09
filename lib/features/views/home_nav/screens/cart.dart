import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_assets.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_colors.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_text_styles.dart';
import 'package:implement_clean_code_for_store/features/controllers/cart_cubit/cart_cubit.dart';

part '../../widgets/cart_item_widget.dart';

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
                      itemCount: state.model[0].products!.length,
                      itemBuilder: (context, index) => CartItem(
                        v: "9",
                        title: state.model[0].products![index].quantity.toString(),
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

