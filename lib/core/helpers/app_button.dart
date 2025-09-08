import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';
class AppButton extends StatelessWidget {
  const AppButton({super.key,required this.text,required this.onPressed});
final String text;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            fixedSize: Size.fromHeight(50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),

        child: Text(text,style: AppStyles.textStyle14white,

        ))
    ;
  }
}
