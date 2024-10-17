import 'package:turath/features/on_boarding/data/on_boarding_repository.dart';
import 'package:turath/features/on_boarding/data/onboarding_model.dart';

class OnBoardingViewModel {
  final OnBoardingRepository _repository = OnBoardingRepository();

  List<OnBoardingModel> getOnBoardingPages() {
    return _repository.getOnBoardingData();
  }
}
