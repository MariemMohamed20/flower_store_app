import 'package:flower_store_application/core/widgets/app_button_.dart';
import 'package:flower_store_application/features/auth/login/presentation/ui/login_screen.dart';
import 'package:flower_store_application/features/auth/register/presentation/ui/register_screen.dart';
import 'package:flutter/material.dart';

class WelcomeAuthScreen extends StatelessWidget {
  const WelcomeAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 83),
              Image.asset(
                'assets/images/Group 60.png',
                height: 60,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 12),
              Text(
                'Create a bouquet in the Goleman',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8C8C8C),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16),
              Image.asset(
                'assets/images/Mobile login-pana 1.png',
                height: 260,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Continue as a guest',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF282828),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

               SizedBox(height: 20),
              AppButton(
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>LoginScreen(), 
                    ),
                  );
                },
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 14, color: Color(0xFF282828)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5E51F5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
