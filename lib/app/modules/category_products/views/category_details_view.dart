import 'package:ecommerce_app/app/components/product_item.dart';
import 'package:ecommerce_app/app/components/screen_title.dart';
import 'package:ecommerce_app/app/modules/category_products/controllers/category_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';

class CategoryDetailsView extends GetView<CategoryDetailsController> {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Obx(() => ListView(
                  children: [
                    30.verticalSpace,
                    ScreenTitle(
                      title: controller.category.name ?? '',
                    ),
                    20.verticalSpace,
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.h,
                        mainAxisExtent: 300.h,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) => ProductItem(
                        product: controller.products[index],
                      ),
                    ),
                    10.verticalSpace,
                  ],
                )),
          ),
          Positioned(
            top: 50.0,
            left: 10.0,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: UniversalImage(
                Icons.close,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
