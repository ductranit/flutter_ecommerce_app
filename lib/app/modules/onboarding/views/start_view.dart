import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_app/app/components/custom_button.dart';
import 'package:ecommerce_app/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';

class StartView extends GetView<OnboardingController> {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = context.theme;
    final images = [
      'assets/images/sample1.jpg',
      'assets/images/sample2.jpg',
      'assets/images/sample3.jpg',
    ];
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Unlock Amazing',
                style: theme.textTheme.displayLarge
                    ?.copyWith(color: theme.textTheme.displayLarge?.color),
              ),
              10.verticalSpace,
              Text(
                'Deals & Discounts',
                style: theme.textTheme.displayLarge
                    ?.copyWith(color: theme.primaryColor),
              ),
              100.verticalSpace,
              SizedBox(
                height: 300.h,
                child: Swiper(
                  itemCount: images.length,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      color: Colors.grey,
                      surfaceTintColor: Theme.of(context).colorScheme.surface,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: UniversalImage(
                        images[index],
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  pagination: SwiperPagination(
                      margin: const EdgeInsets.all(0),
                      builder: DotSwiperPaginationBuilder(
                        activeColor: theme.primaryColor,
                        color: Colors.grey.shade400,
                      ),
                      alignment: Alignment.bottomCenter),
                  customLayoutOption:
                      CustomLayoutOption(startIndex: -1, stateCount: 3)
                        ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                        ..addTranslate([
                          Offset(-370.0, -40.0),
                          Offset(0.0, 0.0),
                          Offset(370.0, -40.0)
                        ]),
                  itemWidth: 300.0,
                  itemHeight: 300.0,
                  layout: SwiperLayout.CUSTOM,
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
              20.verticalSpace,
              CustomButton(
                text: "Let's Get Started".tr,
                onPressed: () {},
                fontSize: 16.sp,
                radius: 12.r,
                verticalPadding: 12.h,
                hasShadow: true,
                width: 320.w,
                shadowColor: theme.primaryColor,
                foregroundColor: theme.textTheme.displayLarge?.color,
                shadowOpacity: 0.3,
                shadowBlurRadius: 4,
                shadowSpreadRadius: 0,
              ).animate().fade().slideY(
                    duration: const Duration(milliseconds: 300),
                    begin: 1,
                    curve: Curves.easeInSine,
                  ),
              20.verticalSpace,
              Text.rich(TextSpan(
                text: "Already have an account? ",
                style: theme.textTheme.bodySmall,
                children: [
                  TextSpan(
                    text: "Sign in".tr,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.toNamed(Routes.AUTH),
                    style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                        decorationColor: theme.primaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
