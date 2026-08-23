import 'package:flower_store_application/features/auth/login/presentation/data/repo/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(LoginLoading());
    try {
      final response = await loginRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(LoginSuccess(message: response.message));
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }
}
