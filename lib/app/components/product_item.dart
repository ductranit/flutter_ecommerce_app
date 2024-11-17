import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';

import '../../utils/constants.dart';
import '../data/models/product_model.dart';
import '../modules/base/controllers/base_controller.dart';
import '../routes/app_pages.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 220.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF1FA),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: UniversalImage(
                        product.image!,
                        height: 200.h,
                        fit: BoxFit.cover,
                      ).animate().slideX(
                            duration: const Duration(milliseconds: 200),
                            begin: 1,
                            curve: Curves.easeInSine,
                          ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15.w,
                  bottom: 20.h,
                  child: GetBuilder<BaseController>(
                    id: 'FavoriteButton',
                    builder: (controller) => GestureDetector(
                      onTap: () => controller.onFavoriteButtonPressed(
                          productId: product.id!),
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: Colors.white,
                        child: UniversalImage(
                          product.isFavorite
                              ? Constants.favFilledIcon
                              : Constants.favOutlinedIcon,
                          color: product.isFavorite ? null : theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ).animate().fade(),
              ],
            ),
            10.verticalSpace,
            AutoSizeText(
              product.name!,
              style: theme.textTheme.bodyMedium,
              minFontSize: 7,
              maxLines: 2,
            ).animate().fade().slideY(
                  duration: const Duration(milliseconds: 200),
                  begin: 1,
                  curve: Curves.easeInSine,
                ),
            5.verticalSpace,
            AutoSizeText(
              '\$${product.price}',
              style: theme.textTheme.displaySmall,
              minFontSize: 7,
              maxLines: 2,
            ).animate().fade().slideY(
                  duration: const Duration(milliseconds: 200),
                  begin: 2,
                  curve: Curves.easeInSine,
                ),
          ],
        ),
      ),
    );
  }
}
