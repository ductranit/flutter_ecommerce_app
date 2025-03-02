import 'package:ecommerce_app/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';

class SplashView extends GetView<OnboardingController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    var theme = context.theme;
    return Scaffold(
      body: Container(
          color: theme.primaryColor,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: UniversalImage(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          )),
    );
  }
}
