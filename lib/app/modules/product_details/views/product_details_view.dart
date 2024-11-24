import 'package:ecommerce_app/app/components/custom_button.dart';
import 'package:ecommerce_app/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';

import 'widgets/rounded_button.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 400.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1FA),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        height: 430,
                        alignment: Alignment.center,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(
                                30.r), // Adjust the radius as needed
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: UniversalImage(
                            controller.product.image!,
                            height: 400.h,
                            fit: BoxFit.contain,
                          ).animate().slideX(
                                duration: const Duration(milliseconds: 300),
                                begin: 1,
                                curve: Curves.easeInSine,
                              ),
                        )),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 20.w,
                    right: 20.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedButton(
                          onPressed: () => Get.back(),
                          child: UniversalImage(Constants.backArrowIcon,
                              fit: BoxFit.none),
                        ),
                        Obx(() => Row(
                              children: [
                                RoundedButton(
                                  onPressed: () =>
                                      controller.onFavoriteButtonPressed(),
                                  child: Align(
                                    child: UniversalImage(
                                      controller.isFavorite()
                                          ? Constants.favFilledIcon
                                          : Constants.favOutlinedIcon,
                                      width: 16.w,
                                      height: 15.h,
                                      color: controller.isFavorite()
                                          ? null
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                RoundedButton(
                                  onPressed: () =>
                                      controller.onAddToCartPressed(),
                                  child: Align(
                                    child: UniversalImage(
                                      Icons.shopping_cart,
                                      width: 16.w,
                                      height: 15.h,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  controller.product.name!,
                  style: theme.textTheme.bodyLarge,
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(
                      '\$${controller.product.price}',
                      style: theme.textTheme.displayMedium,
                    ),
                    30.horizontalSpace,
                    const Icon(Icons.star_rounded, color: Color(0xFFFFC542)),
                    5.horizontalSpace,
                  ],
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
              ),
              20.verticalSpace,
              Html(
                data: controller.product.description ?? '',
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: CustomButton(
                  text: 'Add to Cart',
                  onPressed: () => controller.onAddToCartPressed(),
                  disabled: controller.product.quantity! > 0,
                  fontSize: 16.sp,
                  radius: 12.r,
                  verticalPadding: 12.h,
                  hasShadow: true,
                  shadowColor: theme.primaryColor,
                  shadowOpacity: 0.3,
                  shadowBlurRadius: 4,
                  shadowSpreadRadius: 0,
                ).animate().fade().slideY(
                      duration: const Duration(milliseconds: 300),
                      begin: 1,
                      curve: Curves.easeInSine,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
