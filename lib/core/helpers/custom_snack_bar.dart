import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
showSnackBar(
    BuildContext context,
    String?message,
    AnimatedSnackBarType?type
    ){
  AnimatedSnackBar.material(
    message??'This a snackBar with info type',
    type: type??AnimatedSnackBarType.info,
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
  ).show(context);
}

