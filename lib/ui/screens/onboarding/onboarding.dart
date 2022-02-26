import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wpay/constants/colors.dart';
import 'package:wpay/constants/size_config.dart';
import 'package:wpay/ui/screens/onboarding/onboarding_controller.dart';
import 'package:wpay/ui/widgets/custom_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) {
          return Scaffold(
              body: Column(
            children: [
              Container(
                  color: backgroundColor,
                  width: double.infinity,
                  height: SizeConfig.fromHeight(context, 100),
                  child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.selectedPageindex,
                      itemCount: controller.onboardingItems.length,
                      itemBuilder: (context, index) {
                        return Stack(children: [
                          Positioned(
                              top: SizeConfig.fromHeight(context, 12),
                              left: SizeConfig.fromWidth(context, 90),
                              child: InkWell(
                                onTap: controller.navigateToSignIn,
                                child: const Text("Skip",
                                    style: TextStyle(color: Colors.white)),
                              )),
                          Positioned(
                              top: SizeConfig.fromHeight(context, 25),
                              left: SizeConfig.fromWidth(context, 20),
                              child: SvgPicture.asset(
                                  controller.onboardingItems[index].image)),
                          Positioned(
                              top: SizeConfig.fromHeight(context, 55),
                              left: SizeConfig.fromWidth(context, 45),
                              child: Row(
                                  children: List.generate(
                                      controller.onboardingItems.length,
                                      (index) => Obx(() => InkWell(
                                            onTap: () {
                                              controller.pageController
                                                  .jumpToPage(index);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(
                                                SizeConfig.fontSize(context, 1),
                                              ),
                                              width: SizeConfig.fontSize(
                                                  context, 2),
                                              height: SizeConfig.fontSize(
                                                  context, 2),
                                              decoration: BoxDecoration(
                                                color: controller
                                                            .selectedPageindex
                                                            .value ==
                                                        index
                                                    ? Colors.white
                                                    : Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ))))),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: SizeConfig.fromHeight(context, 35),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    )),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                          controller
                                              .onboardingItems[index].title,
                                          style: TextStyle(
                                              fontSize: SizeConfig.fontSize(
                                                  context, 5),
                                              fontWeight: FontWeight.w700)),
                                      Text(
                                          controller.onboardingItems[index]
                                              .description,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize:
                                                SizeConfig.fontSize(context, 3),
                                          )),
                                      Obx(() => CustomButton(
                                          onTap: controller.isLastPage
                                              ? controller.navigateToSignIn
                                              : controller.nextSlide,
                                          text: controller.isLastPage
                                              ? 'Get Started'
                                              : 'Next'))
                                    ])),
                          ),
                        ]);
                      })),
            ],
          ));
        });
  }
}
