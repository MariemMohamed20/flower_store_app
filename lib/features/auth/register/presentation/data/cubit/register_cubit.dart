import 'package:flower_store_application/features/auth/register/presentation/data/repo/register_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;

  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> register() async {
    emit(RegisterLoading());
    try {
      final response = await registerRepo.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        rePassword: rePasswordController.text,
        phone: phoneController.text,
      );
      
      emit(RegisterSuccess(message: response.message));
    } catch (e) {
      emit(RegisterError(errorMessage: e.toString()));
    }
  }
}