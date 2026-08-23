import 'package:flower_store_application/core/widgets/app_button_.dart';
import 'package:flower_store_application/features/home/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';

class Onboarding1Screen extends StatefulWidget {
  const Onboarding1Screen({super.key});

  @override
  State<Onboarding1Screen> createState() => _Onboarding1ScreenState();
}

class _Onboarding1ScreenState extends State<Onboarding1Screen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/Florist-pana (3) 1.png',
      'title': 'Create personalized bouquet',
      'subtitle':
          'Show off your unique style and message by creating\na customized bouquet.',
    },
    {
      'image': 'assets/images/Reminders-pana 1.png', 
      'title': 'Access your nearest florist',
      'subtitle':
          'Gain access to all nearby florists by entering your\naddress.',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    final data = _onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Image.asset(
                          data['image']!,
                          height: 280,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          data['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF282828),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          data['subtitle']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.4,
                            color: Color(0xFF757575),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: _currentIndex == index ? 28 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? const Color(0xffE50B62)
                          : const Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
               SizedBox(height: 40),

              AppButton(
                text: _currentIndex == _onboardingData.length - 1
                    ? 'Get Started': 'Next',
                onPressed: () {
                  if (_currentIndex < _onboardingData.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                     Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    ); 
                  }
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}