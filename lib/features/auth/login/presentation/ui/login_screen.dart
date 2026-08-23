
import 'package:dio/dio.dart';
import 'package:flower_store_application/core/widgets/app_button_.dart';
import 'package:flower_store_application/features/auth/login/presentation/data/cubit/login_cubit.dart';
import 'package:flower_store_application/features/auth/login/presentation/data/cubit/login_state.dart';
import 'package:flower_store_application/features/auth/login/presentation/data/repo/login_repo.dart';
import 'package:flower_store_application/features/auth/register/presentation/ui/widgets/app_validators.dart';
import 'package:flower_store_application/features/auth/register/presentation/ui/widgets/custom_text_field.dart';
import 'package:flower_store_application/features/home/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        loginRepo: LoginRepo(dio: Dio()),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.green),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();

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
                                  'assets/images/Frame 1506.png',
                                  height: 36,
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                             SizedBox(height: 8),
                             Text(
                              'Hello! we are happy to have you back at\nGoleman',
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
                        label: 'E-mail*',
                        hintText: 'email',
                        controller: cubit.emailController, 
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidators.validateEmail,
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        label: 'Enter Password*',
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
                      state is LoginLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFFF870A6),
                              ),
                            )
                          : AppButton(
                              text: 'Login',
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  // استدعاء دالة الـ login في الكيوبك لإرسال البيانات للـ API
                                  cubit.login();
                                }
                              },
                            ),
                      const SizedBox(height: 24),
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