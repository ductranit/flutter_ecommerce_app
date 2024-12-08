import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/app/data/models/cart_model.dart';
import 'package:ecommerce_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';

class CartItemView extends GetView<CartController> {
  final CartItem cart;
  const CartItemView({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: Stack(
              children: [
                Container(
                  width: 105.w,
                  height: 125.h,
                  color: const Color(0xFFEDF1FA),
                ),
                Positioned(
                  left: 0.w,
                  bottom: 00.h,
                  width: 105.w,
                  height: 125.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: UniversalImage(
                      cart.product?.image ?? '',
                      height: 200.h,
                      fit: BoxFit.contain,
                    ).animate().slideX(
                          duration: const Duration(milliseconds: 200),
                          begin: 1,
                          curve: Curves.easeInSine,
                        ),
                  ),
                ),
              ],
            ),
          ),
          20.horizontalSpace,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.verticalSpace,
              AutoSizeText(
                cart.product?.name ?? '',
                style: theme.textTheme.displaySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              5.verticalSpace,
              Text(
                '\$${cart.product?.price}',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontSize: 18.sp,
                ),
              ),
              10.verticalSpace,
              GetBuilder<CartController>(
                id: 'ProductQuantity',
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => controller.onIncreasePressed(cart.product!),
                      child: UniversalImage(Constants.decreaseIcon),
                    ),
                    10.horizontalSpace,
                    Text('${cart.quantity}',
                        style: theme.textTheme.displaySmall),
                    10.horizontalSpace,
                    GestureDetector(
                      onTap: () => controller.onDecreasePressed(cart.product!),
                      child: UniversalImage(Constants.increaseIcon),
                    ),
                  ],
                ),
              ),
            ],
          )),
          InkWell(
            onTap: () => controller.onDeletePressed(cart.product!),
            customBorder: const CircleBorder(),
            child: Container(
              padding: EdgeInsets.all(10.r),
              child: UniversalImage(
                Constants.cancelIcon,
                width: 20.w,
                height: 20.h,
                color: theme.textTheme.bodyMedium!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
