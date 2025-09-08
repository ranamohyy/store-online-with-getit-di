import 'package:flutter/material.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_colors.dart';
import 'package:implement_clean_code_for_store/features/views/home_nav/screens/account.dart';
import 'package:implement_clean_code_for_store/features/views/home_nav/screens/cart.dart';
import 'package:implement_clean_code_for_store/features/views/home_nav/screens/home_page.dart';
class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  int currentIndex=0;
  List<Widget>screens=[
    HomePageScreen(),
    CartScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.scaffoldBackGroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.scaffoldBackGroundColor,
        selectedItemColor: AppColors.primaryColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex=value;
            });
          },
          items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: "Home"),BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,),
            label: "Cart"),BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined,),
            label: "Account"),
      ]),
      body: screens[currentIndex],


    );
  }
}
