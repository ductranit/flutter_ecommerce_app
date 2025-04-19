import 'package:ecommerce_app/app/components/custom_button.dart';
import 'package:ecommerce_app/app/components/product_item.dart';
import 'package:ecommerce_app/app/components/top_bar.dart';
import 'package:ecommerce_app/app/data/models/category_model.dart';
import 'package:ecommerce_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:universal_image/universal_image.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget _buildTopProduct(BuildContext context) {
    var theme = context.theme;
    return Stack(children: [
      Card(
        color: Colors.grey[100],
        elevation: 0.0,
        child: UniversalImage(
          'assets/images/sample4.png',
          fit: BoxFit.cover,
          height: 250.h,
          width: double.infinity,
        ),
      ),
      Positioned(
          bottom: 20,
          child: CustomButton(
            text: "Shop Now".tr,
            onPressed: () {},
            fontSize: 14.sp,
            radius: 12.r,
            verticalPadding: 10.h,
            hasShadow: true,
            width: 140.w,
            shadowColor: theme.primaryColor,
            foregroundColor: theme.textTheme.displayLarge?.color,
          )),
    ]);
  }

  Widget _buildTrendingProduct(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: UniversalImage('assets/images/sample4.png',
                  fit: BoxFit.cover)),
          10.horizontalSpace,
          Expanded(
              child: UniversalImage('assets/images/sample4.png',
                  fit: BoxFit.cover)),
        ],
      ),
    );
  }

  List<Widget> _buildFlashSale(BuildContext context) {
    if (controller.products.isEmpty) return [];
    final theme = context.theme;
    return [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.horizontalSpace,
          Text(
            "Flash Sale".tr,
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text('End in: '),
          SlideCountdownSeparated(
            duration: Duration(hours: 12, minutes: 30, seconds: 47),
            separatorType: SeparatorType.symbol,
            separatorPadding: EdgeInsets.symmetric(horizontal: 4.w),
          ),
          10.horizontalSpace,
        ],
      ),
      10.verticalSpace,
      Container(
        height: 300.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: PageView.builder(
          itemCount: (controller.products.length / 2).ceil(),
          itemBuilder: (context, index) {
            final startIndex = index * 2;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (startIndex < controller.products.length)
                  Expanded(
                    child: ProductItem(
                      product: controller.products[startIndex],
                    ),
                  ),
                10.horizontalSpace,
                if (startIndex + 1 < controller.products.length)
                  Expanded(
                    child: ProductItem(
                      product: controller.products[startIndex + 1],
                    ),
                  ),
              ],
            );
          },
          onPageChanged: (index) {
            controller.currentPage.value = index;
          },
        ),
      ),
      PageViewDotIndicator(
        currentItem: controller.currentPage.value,
        count: controller.products.length,
        unselectedColor: Colors.grey[300]!,
        selectedColor: theme.primaryColor,
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        size: Size(8, 8),
      ),
    ];
  }

  List<Widget> _buildCategoryList(
      BuildContext context, CategoryModel category) {
    final theme = context.theme;
    if (controller.products.isEmpty) return [];
    return [
      Row(
        children: [
          10.horizontalSpace,
          Text(
            category.name ?? '',
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text('View All'.tr,
              style: context.theme.textTheme.titleMedium
                  ?.copyWith(color: theme.primaryColor)),
          10.horizontalSpace,
        ],
      ),
      10.verticalSpace,
      Container(
        height: 600.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: PageView.builder(
          itemCount: (controller.products.length / 4).ceil(),
          itemBuilder: (context, index) {
            final startIndex = index * 4;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (startIndex < controller.products.length)
                      Expanded(
                        child: ProductItem(
                          product: controller.products[startIndex],
                        ),
                      ),
                    if (startIndex + 1 < controller.products.length)
                      Expanded(
                        child: ProductItem(
                          product: controller.products[startIndex + 1],
                        ),
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (startIndex + 2 < controller.products.length)
                      Expanded(
                        child: ProductItem(
                          product: controller.products[startIndex + 2],
                        ),
                      ),
                    if (startIndex + 3 < controller.products.length)
                      Expanded(
                        child: ProductItem(
                          product: controller.products[startIndex + 3],
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      PageViewDotIndicator(
        currentItem: controller.currentPage.value,
        count: controller.products.length,
        unselectedColor: Colors.grey[300]!,
        selectedColor: theme.primaryColor,
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        size: Size(8, 8),
      ),
      10.verticalSpace,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(children: [
            TopBar(
              title: '',
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: UniversalImage('assets/images/bell.svg'),
                ),
                GestureDetector(
                  onTap: () {},
                  child: UniversalImage('assets/images/bell.svg'),
                ),
              ],
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              color: Colors.grey[100],
              child: ListView(
                children: [
                  _buildTopProduct(context),
                  10.verticalSpace,
                  _buildTrendingProduct(context),
                  10.verticalSpace,
                  ..._buildFlashSale(context),
                  10.verticalSpace,
                  ...controller.categories
                      .map((category) => _buildCategoryList(context, category))
                      .expand((widgets) => widgets),
                  10.verticalSpace,
                ],
              ),
            ))
          ])),
    );
  }
}
