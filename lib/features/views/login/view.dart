import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implement_clean_code_for_store/core/di/get_it.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_button.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_colors.dart';
import 'package:implement_clean_code_for_store/core/helpers/app_field.dart';
import 'package:implement_clean_code_for_store/core/helpers/my_snack_bar.dart';
import 'package:implement_clean_code_for_store/features/views/home_nav/view.dart';
import '../../../core/helpers/app_text_styles.dart';
import '../../controllers/login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener:(context, state) {
            if(state is LoginFailure){
              appSnackBar(state.msg, AnimatedSnackBarType.error, context);
            }
            if(state is LoginSuccess) {
              appSnackBar(
                  "Login Successful", AnimatedSnackBarType.success, context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeNavScreen(),));
            }
            } ,
          builder: (context, state) {
            final cubit=context.read<LoginCubit>();
            if(state is LoginLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "loginToYourAccount".tr(),
                    style: AppStyles.textStyle32Black,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "It’s great to see you again.",
                    style: AppStyles.textStyle16Grey,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "User Name",
                    style: AppStyles.textStyle16Black,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  AppField(hintText: "Enter Your name",
                  controller: cubit.nameController,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Password",
                    style: AppStyles.textStyle16Black,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  AppField(hintText: "Enter Your password",
                  controller:cubit.passwordController ,
                    obscure:cubit.obscureText ,
                    suffixIcon:GestureDetector(
                        onTap: () => cubit.changeEyeIcon(),
                        child:
                        cubit.obscureText==true?
                        Icon(Icons.visibility_off,color: AppColors.greyColor,):
                        Icon(Icons.visibility
                          ,color: AppColors.greyColor,)

                    ) ,
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  AppButton(text: "Sign In", onPressed: () =>cubit.login()),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?",
                        style: AppStyles.textStyle16Grey,),
                      Text(" Join", style: AppStyles.textStyle16Black.copyWith(
                          decoration: TextDecoration.underline
                      ),),

                    ],)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
