import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/app/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UniversalImage(
            'assets/images/sample4.png',
            fit: BoxFit.cover,
            width: 70,
            height: 70,
          ),
          AutoSizeText(
            category.name ?? '',
            style: context.theme.textTheme.titleMedium,
            maxLines: 2,
            minFontSize: 7,
          ),
        ],
      ),
    );
  }
}
