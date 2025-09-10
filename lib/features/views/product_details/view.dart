import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_button.dart';
import 'package:implement_clean_code_for_store/core/helpers/my_snack_bar.dart';
import 'package:implement_clean_code_for_store/features/controllers/cart_cubit/cart_cubit.dart';
import 'package:implement_clean_code_for_store/features/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 80,
        color: Colors.white,
        child: Row(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "price",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              Text(
                r"$" + model.price.toString(),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              )
            ],
          ),
          SizedBox(
            width: 22,
          ),
          Expanded(
              child:
              BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if(state is addCartSuccess){
                  appSnackBar("item added successfully", AnimatedSnackBarType.success, context);
                }
                if(state is addCartFailure){
                  appSnackBar("fail to add", AnimatedSnackBarType.success, context);
                }
              },
                builder: (context, state) {
                  if(state is addCartLoading){
                   return Center(child: CircularProgressIndicator());
                  }
                  return AppButton(
                      text: "Add To Cart",
                      onPressed: () {
                        context.read<CartCubit>().addToCart();
                      }
                  );
                },
              )
          )
        ]),
      ),
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                height: 360,
                child: Image.network(model.image ?? "")),
            SizedBox(
              height: 12,
            ),
            Text(
              model.title ?? "Fit Polo T Shirt",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              spacing: 8,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Text(
                  "${model.rating!.rate ?? 4}/5",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  "(${model.rating!.count ?? 45} reviews)",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              model.description ??
                  "Blue T Shirt . Good All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
