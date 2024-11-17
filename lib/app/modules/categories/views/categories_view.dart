import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/app/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../components/screen_title.dart';
import '../controllers/categories_controller.dart';

class CaetgoriesView extends GetView<CategoriesController> {
  const CaetgoriesView({super.key});

  Widget _buildList(CategoryModel category) {
    // If category has children, show ExpansionTile
    if (category.children.isNotEmpty) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ExpansionTile(
          title: AutoSizeText(
            category.name ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(left: 16),
              itemCount: category.children.length,
              itemBuilder: (context, childIndex) {
                final child = category.children[childIndex];
                return ListTile(
                  title: AutoSizeText(
                    child.name ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  onTap: () {
                    // Handle child category tap
                    Get.find<Logger>()
                        .i('Tapped on child category: ${child.name}');
                  },
                );
              },
            ),
          ],
        ),
      );
    }

    // If category has no children, show simple ListTile
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text(category.name ?? ''),
        onTap: () {
          // Handle category tap
          Get.find<Logger>().i('Tapped on category: ${category.name}');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() => Column(
              children: [
                30.verticalSpace,
                ScreenTitle(
                  title: 'Categories'.tr,
                ),
                20.verticalSpace,
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    return _buildList(controller.categories[index]);
                  },
                  itemCount: controller.categories.length,
                )),
                10.verticalSpace,
              ],
            )),
      ),
    );
  }
}
