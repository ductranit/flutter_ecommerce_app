import 'package:animated_login/animated_login.dart';
import 'package:ecommerce_app/config/theme/my_fonts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
        textFormStyle: baseTheme.textTheme.bodyMedium,
        welcomeTitleStyle: baseTheme.textTheme.bodyLarge,
        welcomeDescriptionStyle: baseTheme.textTheme.bodyLarge,
        formTitleStyle: MyFonts.getAppFontType,
        forgotPasswordStyle: baseTheme.textTheme.bodyLarge,
        actionButtonStyle: TextButton.styleFrom(
          backgroundColor: baseTheme.primaryColor,
          foregroundColor: baseTheme.textTheme.bodyMedium?.color,
          textStyle: baseTheme.textTheme.bodyMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        changeActionButtonStyle: TextButton.styleFrom(
          backgroundColor: baseTheme.primaryColor,
          foregroundColor: baseTheme.textTheme.bodyMedium?.color,
          textStyle: baseTheme.textTheme.bodyMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        changeLangButtonStyle: TextButton.styleFrom(
          backgroundColor: baseTheme.primaryColor,
          foregroundColor: baseTheme.textTheme.bodyMedium?.color,
          textStyle: baseTheme.textTheme.bodyMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        changeActionTextStyle: baseTheme.textTheme.bodyMedium,
        hintTextStyle: baseTheme.textTheme.bodyMedium,
        useEmailStyle: baseTheme.textTheme.bodyMedium,
        formFieldBackgroundColor: baseTheme.scaffoldBackgroundColor,
        backgroundColor: baseTheme.scaffoldBackgroundColor,
        fillColor: baseTheme.scaffoldBackgroundColor,
        animatedComponentOrder: [
          AnimatedComponent(
            component: LoginComponents.title,
            animationType: AnimationType.left,
          ),
          AnimatedComponent(
            component: LoginComponents.description,
            animationType: AnimationType.left,
          ),
          AnimatedComponent(component: LoginComponents.form),
          AnimatedComponent(
            component: LoginComponents.forgotPassword,
            animationType: AnimationType.left,
          ),
          AnimatedComponent(
            component: LoginComponents.actionButton,
            animationType: AnimationType.left,
          ),
          AnimatedComponent(component: LoginComponents.useEmail),
          AnimatedComponent(component: LoginComponents.socialLogins),
          AnimatedComponent(
            component: LoginComponents.changeActionButton,
            animationType: AnimationType.left,
          ),
          AnimatedComponent(component: LoginComponents.notHaveAnAccount),
        ]);
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => AnimatedLogin(
                loginTexts: LoginTexts(
                  welcomeBack: 'Sign in'.tr,
                  welcomeBackDescription:
                      'Welcome back! Please enter your details'.tr,
                  notHaveAnAccount: 'Don\'t have an account?'.tr,
                  loginUseEmail: 'Or continue with'.tr,
                  login: 'Sign in'.tr,
                ),
                socialLogins: [
                  SocialLogin(
                    iconPath: 'assets/images/apple.svg',
                    callback: () async {
                      return null;
                    },
                  ),
                  SocialLogin(
                    iconPath: 'assets/images/google.svg',
                    callback: () async {
                      return null;
                    },
                  ),
                  SocialLogin(
                    iconPath: 'assets/images/facebook.svg',
                    callback: () async {
                      return null;
                    },
                  ),
                ],
                emailController: kDebugMode
                    ? TextEditingController(
                        text: dotenv.get('TEST_EMAIL', fallback: ''))
                    : null,
                passwordController: kDebugMode
                    ? TextEditingController(
                        text: dotenv.get('TEST_PASSWORD', fallback: ''))
                    : null,
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
                  color: baseTheme.appBarTheme.actionsIconTheme?.color,
                ),
              ))
        ],
      ),
    );
  }
}
