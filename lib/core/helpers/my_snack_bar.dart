

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';

appSnackBar(String msg,AnimatedSnackBarType type,BuildContext context){
  AnimatedSnackBar.material(
    msg,
    type: type,
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
  ).show(context);

}