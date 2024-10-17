import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:turath/features/bazar/bazar_screen.dart';
import 'package:turath/features/cart/cart_provider.dart';
import 'package:turath/features/civilization/civilization_screen.dart';
import 'package:turath/features/figures/figures_screen.dart';
import 'package:turath/features/home/home_screen.dart';
import 'package:turath/features/login/login_screen.dart';
import 'package:turath/features/sign-up/signup_screen.dart';
import 'package:turath/features/wars/wars_screen.dart';
import 'package:provider/provider.dart';
// import 'cart_provider.dart'; // تأكد من استيراد CartProvider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const TurathApp(), 
    ),
  );
}

// TurathApp
class TurathApp extends StatefulWidget {
  const TurathApp({super.key});

  @override
  State<TurathApp> createState() => _TurathAppState();
}

class _TurathAppState extends State<TurathApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:      BazaarPage(),


      home: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? const HomeScreen()
          : const LoginScreen(),

                routes: {
        "signup": (context) => const SignupScreen(),
        "login": (context) => const LoginScreen(),
        "home": (context) => const HomeScreen(),
        "civilizations": (context) => const CivilizationScreen(),
        "wars": (context) => const WarsScreen(),
        "figures": (context) => const FiguresScreen(),
        "bazar": (context) => BazaarPage(),

      },
    );
  }
}
