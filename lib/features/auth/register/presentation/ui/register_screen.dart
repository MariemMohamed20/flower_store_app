import 'package:dio/dio.dart';
import 'package:flower_store_application/core/widgets/app_button_.dart';
import 'package:flower_store_application/features/auth/register/presentation/data/repo/register_repo.dart';
import 'package:flower_store_application/features/auth/register/presentation/data/cubit/register_cubit.dart';
import 'package:flower_store_application/features/auth/register/presentation/data/cubit/register_state.dart';
import 'package:flower_store_application/features/auth/register/presentation/ui/widgets/app_validators.dart';
import 'package:flower_store_application/features/auth/register/presentation/ui/widgets/custom_text_field.dart';
import 'package:flower_store_application/features/onboarding/presentation/ui/onboarding1_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(registerRepo: RegisterRepo(dio: Dio())),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Onboarding1Screen(),
              ),
            );
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: cubit.formKey, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/Frame 1507.png',
                                  height: 36,
                                ),
                                SizedBox(width: 8),
                              ],
                            ),
                           SizedBox(height: 8),
                            Text(
                              'Hello! we are glad you’re here. together,\nwe make the very happy time.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF8C8C8C),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32),
                      CustomTextField(
                        label: 'Enter Number',
                        hintText: 'Enter Number',
                        controller:
                            cubit.phoneController, 
                        keyboardType: TextInputType.phone,
                        validator: AppValidators.validatePhone,
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        label: 'Full name',
                        hintText: 'Full name',
                        controller: cubit.nameController,
                        keyboardType: TextInputType.name,
                        validator: AppValidators.validateName,
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        label: 'E-mail',
                        hintText: 'email',
                        controller: cubit.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidators.validateEmail,
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        label: 'Enter Password',
                        hintText: 'password',
                        controller: cubit.passwordController,
                        obscureText: _isPasswordObscured,
                        validator: AppValidators.validatePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordObscured
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xFFF870A6),
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordObscured = !_isPasswordObscured;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 28),
                      state is RegisterLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFFF870A6),
                              ),
                            )
                          : AppButton(
                              text: 'Sign up',
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.rePasswordController.text =
                                      cubit.passwordController.text;
                                  cubit.register();
                                }
                              },
                            ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
