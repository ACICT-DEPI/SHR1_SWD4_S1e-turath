import 'package:flutter/material.dart';
import 'package:turath/core/database/cache/cache_helper.dart';
import 'package:turath/core/services/service_locator.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';
import 'package:turath/features/splash/presintation/view-model/splash_view_model.dart';

class SconedSplachScreen extends StatefulWidget {
  const SconedSplachScreen({super.key});

  @override
  State<SconedSplachScreen> createState() => _SconedSplachScreenState();
}

class _SconedSplachScreenState extends State<SconedSplachScreen> {
  late SplashViewModel splashViewModel;

  @override
  void initState() {
    bool isOnboardingVisited =
        getIt<CacheHelper>().getData(key: "isOnboardingVisited") ?? false;
    if (isOnboardingVisited == true) {
      splashViewModel = SplashViewModel(context);
      splashViewModel.startSplashTimer('/login');
    } else {
      splashViewModel = SplashViewModel(context);
      splashViewModel.startSplashTimer('/on_boarding');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1c1c),
      body: Center(
        child: Text(
          "تُراث",
          style: AppTextStyle.arabicTextW800S48.copyWith(
            fontSize: 100,
            color: AppColors.textColorPrimary,
          ),
        ),
      ),
    );
  }
}
