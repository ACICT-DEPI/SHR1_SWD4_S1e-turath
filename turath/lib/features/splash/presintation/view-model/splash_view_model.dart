import 'package:flutter/material.dart';
import 'package:turath/core/functions/navigation.dart';

class SplashViewModel {
  final BuildContext context;

  SplashViewModel(this.context);

  void startSplashTimer(String nextRoute) {
    Future.delayed(const Duration(seconds: 2), () {
      customReplacementNavigate(context, nextRoute);
    });
  }
}
