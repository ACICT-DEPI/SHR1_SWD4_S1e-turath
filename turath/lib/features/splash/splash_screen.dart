import 'dart:async';

import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/splash/splash1_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Splash1Screen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xff1c1c1c),
          body: Center(
            child: Image.asset(Assets.imagesSplashicon,
                color: const Color(0xffEDE4DD),
                width: 350,
                height: double.infinity),
          ),
        ));
  }
}
