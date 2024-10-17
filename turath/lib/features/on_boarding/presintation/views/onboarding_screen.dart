import 'package:flutter/material.dart';
import 'package:turath/core/database/cache/cache_helper.dart';
import 'package:turath/core/functions/navigation.dart';
import 'package:turath/core/services/service_locator.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/on_boarding/presintation/view-model/onboarding_view_model.dart';
import 'package:turath/features/on_boarding/presintation/views/on_boarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = _viewModel.getOnBoardingPages();

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: pages.map((page) {
              return OnBoardingPage(
                image: page.image,
                title: page.title,
                description: page.description,
                pageIndex: pages.indexOf(page),
                onLogInPressed: () {
                  getIt<CacheHelper>()
                      .saveData(key: "isOnboardingVisited", value: true);
                  customReplacementNavigate(context, '/login');
                },
                onSignUpPressed: () {
                  getIt<CacheHelper>()
                      .saveData(key: "isOnboardingVisited", value: true);
                  customReplacementNavigate(context, '/signup');
                },
              );
            }).toList(),
          ),
          _buildPageIndicator(),
        ],
      ),
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
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 10,
            width: _currentPage == index ? 20 : 10,
            decoration: BoxDecoration(
              color:
                  _currentPage == index ? AppColors.primaryColor : Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
