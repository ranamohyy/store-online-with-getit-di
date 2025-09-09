import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implement_clean_code_for_store/core/repo/auth_repo.dart';
import 'package:implement_clean_code_for_store/features/models/user_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  void changeEyeIcon() {
    obscureText = !obscureText;
    emit(LoginInitial());
  }

  void login() async {
    emit(LoginLoading());
    final Either<String, UserModel> response = await authRepo.login(
        userName: nameController.text, password: passwordController.text);
    response.fold(
      (error) {
        emit(LoginFailure(error));
      },
      (r) {
        emit(LoginSuccess());
      },
    );
  }
}
