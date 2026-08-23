
import 'package:flower_store_application/features/welcome/presentation/ui/welcome_auth_screen.dart';
import 'package:flutter/material.dart';

class FlowerStoreApp extends StatelessWidget {
  const FlowerStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:WelcomeAuthScreen(),
    );
  }
}