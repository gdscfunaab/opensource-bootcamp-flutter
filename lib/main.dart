import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:wpay/constants/colors.dart';
import 'package:wpay/ui/screens/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: const Onboarding(),
      image: Image.asset('assets/logo.png'),
      backgroundColor: backgroundColor,
      photoSize: 100.0,
    );
  }
}
