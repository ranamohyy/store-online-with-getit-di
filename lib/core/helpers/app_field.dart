import 'package:flutter/material.dart';

import 'app_colors.dart';
class AppField extends StatelessWidget {
  const AppField({super.key,required this.hintText,this.prefixIcon,this.controller,this.suffixIcon,
  this.obscure=false
  });
final String hintText;
final Widget ?prefixIcon;
final Widget ?suffixIcon;
 final TextEditingController? controller;
 final bool obscure;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscure,
      controller:controller ,
      decoration: InputDecoration(
          prefixIcon:prefixIcon,
          suffixIcon:suffixIcon ,
          hintText:hintText,
          hintStyle: TextStyle(
              color: AppColors.boldGreyColor
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primaryColor)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.fieldBorderColor)

          )
      ),

    );
  }
}
