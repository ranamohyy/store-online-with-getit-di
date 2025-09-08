import 'package:flutter/material.dart';
import 'package:implement_clean_code_for_store/core/di/get_it.dart';
import 'package:implement_clean_code_for_store/core/helpers/cache_helper.dart';
import 'package:implement_clean_code_for_store/features/views/login/view.dart';
import 'package:lottie/lottie.dart';

import '../home_nav/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () async {
      getIt<CacheHelper>().getToken().then((value) {
        if (value.isNotEmpty) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeNavScreen(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Lottie.asset("assets/json/shopping.json", fit: BoxFit.fill)),
    );
  }
}
