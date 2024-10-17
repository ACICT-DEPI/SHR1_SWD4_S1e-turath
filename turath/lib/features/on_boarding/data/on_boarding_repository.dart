import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/on_boarding/data/onboarding_model.dart';

class OnBoardingRepository {
  List<OnBoardingModel> getOnBoardingData() {
    return [
      OnBoardingModel(
        image: Assets.imagesOnboarding1image,
        title: 'Welcome to Our App',
        description: 'Explore the amazing features we offer',
      ),
      OnBoardingModel(
        image: Assets.imagesOnboarding2image,
        title: 'Discover',
        description: "Let's Explore History Together",
      ),
      OnBoardingModel(
        image: Assets.imagesOnboarding3image,
        title: 'Get Started Now!',
        description: 'Join us and enjoy the journey',
      ),
    ];
  }
}
