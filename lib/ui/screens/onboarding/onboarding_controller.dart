import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wpay/models/onboarding_model.dart';
import 'package:wpay/ui/screens/auth/sign_in/sign_in.dart';

class OnboardingController extends GetxController {
  var selectedPageindex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageindex.value == onboardingItems.length - 1;

  List<OnboardingModel> onboardingItems = [
    OnboardingModel("assets/onboarding_1.svg", "Fastest Payment",
        "QR code scanning technology makes your payment process more faster"),
    OnboardingModel("assets/onboarding_3.svg", "Safest Platform",
        "Multiple verification and face ID makes your account more safely"),
    OnboardingModel("assets/onboarding_2.svg", "Pay Anything",
        "Supports many types of payments and pay without being complicated"),
  ];

  nextSlide() {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
  }

  navigateToSignIn() {
    Get.to(const SignIn());
  }
}
