import 'package:ecommerce_app/app/components/product_item.dart';
import 'package:ecommerce_app/app/components/screen_title.dart';
import 'package:ecommerce_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() => ListView(
              children: [
                30.verticalSpace,
                ScreenTitle(
                  title: 'Home'.tr,
                ),
                20.verticalSpace,
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                    mainAxisExtent: kIsWeb ? 500.h : 300.h,
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
    );
  }
}
