import 'package:animated_login/animated_login.dart';
import 'package:ecommerce_app/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = context.theme;
    final theme = LoginViewTheme(
      animationCurve: Curves.easeInOutSine,
      textFormStyle: MyFonts.buttonTextStyle.copyWith(color: Colors.white),
      formTitleStyle: MyFonts.getAppFontType,
    );
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => AnimatedLogin(
                passwordValidator: ValidatorModel(
                  checkLowerCase: false,
                  checkUpperCase: false,
                  checkNumber: false,
                  checkSpace: false,
                  length: 6,
                ),
                initialMode: controller.loginMode.value
                    ? AuthMode.login
                    : AuthMode.signup,
                loginMobileTheme: theme,
                loginDesktopTheme: theme,
                onLogin: (loginData) async {
                  final result = await controller.login(
                      loginData.email, loginData.password);
                  if (result == null) {
                    Get.back();
                  }
                  return result;
                },
                onSignup: (signUpData) async {
                  final result = await controller.signUp(
                    signUpData.name,
                    signUpData.email,
                    signUpData.password,
                    signUpData.confirmPassword,
                  );

                  if (result == null) {
                    controller.loginMode.value = true;
                  }
                  return result;
                },
                onForgotPassword: (email) async {
                  final result = await controller.forgotPassword(email);
                  if (result == null) {
                    controller.loginMode.value = true;
                  }
                  return result;
                },
              )),
          Positioned(
              left: 20,
              top: 50,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: UniversalImage(
                  Icons.close,
                  height: 50,
                  width: 50,
                  color: baseTheme.secondaryHeaderColor,
                ),
              ))
        ],
      ),
    );
  }
}
