import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/login/login_screen.dart';
import 'package:turath/features/sign-up/signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1c1c),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildPage(
                image: Assets.imagesOnboarding1image,
                title: 'Welcome to Our App',
                description: 'Explore the amazing features we offer',
                pageIndex: 0,
              ),
              _buildPage(
                image: Assets.imagesOnboarding2image,
                title: 'Discover',
                description: "Let's Explore History Together",
                pageIndex: 1,
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: _buildPage(
                        image: Assets.imagesOnboarding3image,
                        title: 'Get Started Now!',
                        description: 'Join us and enjoy the journey',
                        pageIndex: 2,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 550,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    color: const Color(0xFFC8876B), width: 2),
                                minimumSize: const Size(350, 50),
                                backgroundColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(350, 50),
                                backgroundColor: const Color(0xFFC8876B),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
          _buildPageIndicator(),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String description,
    required int pageIndex,
  }) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - pageIndex;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }

        return Opacity(
          opacity: value,
          child: Transform(
            transform: Matrix4.identity()..scale(value, value),
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black87,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  opacity: 0.7,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 250),
                  Text(
                    title,
                    style: const TextStyle(
                        color: const Color(0xffEDE4DD),
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      color: const Color(0xffEDE4DD),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPageIndicator() {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 10,
            width: _currentPage == index ? 25 : 10,
            decoration: BoxDecoration(
              color:
                  _currentPage == index ? const Color(0xFFC8876B) : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
