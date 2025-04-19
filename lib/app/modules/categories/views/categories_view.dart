import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/app/components/top_bar.dart';
import 'package:ecommerce_app/app/modules/categories/views/category_item.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:ecommerce_app/utils/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';
import '../controllers/categories_controller.dart';

class CaetgoriesView extends GetView<CategoriesController> {
  const CaetgoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
            children: [
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
                  child: Row(
                children: [
                  Container(
                    width: 100.w,
                    color: Colors.grey[100],
                    child: ListView.builder(
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        final category = controller.categories[index];
                        final isSelected =
                            controller.selectedCategoryIndex.value == index;

                        return GestureDetector(
                          onTap: () {
                            controller.selectedCategoryIndex.value = index;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: isSelected
                                      ? Colors.yellow
                                      : Colors.transparent,
                                  width: 4.w,
                                ),
                              ),
                              color: isSelected
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 10.w),
                            child: AutoSizeText(
                              category.name ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    isSelected ? Colors.black : Colors.black54,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Right Column - Child Categories
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.CATEGORIES_DETAILS,
                                    arguments: controller.categories[controller
                                        .selectedCategoryIndex.value]);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    controller.categories
                                            .tryGet(controller
                                                .selectedCategoryIndex.value)
                                            ?.name ??
                                        '',
                                    style: context.theme.textTheme.titleMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Visibility(
                                      visible: controller
                                              .selectedCategoryIndex.value >
                                          0,
                                      child: UniversalImage(
                                        Icons.arrow_forward_ios,
                                        width: 20.w,
                                        height: 20.h,
                                      ))
                                ],
                              ),
                            ),
                            10.verticalSpace,
                            Expanded(
                              child: controller.selectedCategoryIndex.value < 0
                                  ? const SizedBox.shrink()
                                  : GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, // 2 columns
                                        crossAxisSpacing: 10.w,
                                        mainAxisSpacing: 10.h,
                                        childAspectRatio: 1,
                                      ),
                                      itemCount: controller
                                          .categories[controller
                                              .selectedCategoryIndex.value]
                                          .children
                                          .length,
                                      itemBuilder: (context, childIndex) {
                                        final child = controller
                                            .categories[controller
                                                .selectedCategoryIndex.value]
                                            .children[childIndex];
                                        return GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                Routes.CATEGORIES_DETAILS,
                                                arguments: child);
                                          },
                                          child: CategoryItem(
                                            category: child,
                                          ),
                                        );
                                      },
                                    ),
                            )
                          ],
                        )),
                  ),
                ],
              ))
            ],
          )),
    );
  }
}
