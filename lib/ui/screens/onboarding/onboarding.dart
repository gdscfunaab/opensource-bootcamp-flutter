import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wpay/constants/colors.dart';
import 'package:wpay/constants/size_config.dart';
import 'package:wpay/ui/screens/onboarding/onboarding_controller.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) {
          return Container(
            color: backgroundColor,
            width: double.infinity,
            height: SizeConfig.fromHeight(context, 100),
            child: Stack(children: [
              PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.selectedPageindex,
                  itemCount: controller.onboardingItems.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      SvgPicture.asset(controller.onboardingItems[index].image),
                      Text(controller.onboardingItems[index].title),
                      Text(controller.onboardingItems[index].description),
                    ]);
                  })
            ]),
          );
        });
  }
}
