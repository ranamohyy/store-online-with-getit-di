import 'package:flutter/material.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_colors.dart';
import 'package:implement_clean_code_for_store/features/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key,required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                r"$"+model.price.toString(),
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
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: AppColors.primaryColor),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "Add To Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
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
                child: Image.network(model.image??"")),
            SizedBox(
              height: 12,
            ),
            Text(
             model.title?? "Fit Polo T Shirt",
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
                  "${model.rating!.rate??4}/5",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  "(${model.rating!.count??45} reviews)",
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
             model.description?? "Blue T Shirt . Good All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
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
