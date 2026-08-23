import 'package:flower_store_application/core/widgets/app_button_.dart';
import 'package:flower_store_application/features/home/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';

class Onboarding2Screen extends StatefulWidget {
  const Onboarding2Screen({super.key});

  @override
  State<Onboarding2Screen> createState() => _Onboarding2ScreenState();
}

class _Onboarding2ScreenState extends State<Onboarding2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 103),
              Image.asset(
                'assets/images/Reminders-pana 1.png',
                height: 280,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 28,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xffE50B62),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),
              Text(
                'Access your nearest florist',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF282828),
                ),
              ),

              SizedBox(height: 12),
              Text(
                'Gain access to all nearby florists by entering your\naddress.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: Color(0xFF757575),
                ),
              ),
              SizedBox(height: 83),
              AppButton(
                text: 'Get Start',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),

              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
