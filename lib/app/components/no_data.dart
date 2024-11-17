import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';

import '../../utils/constants.dart';

class NoData extends StatelessWidget {
  final String? text;
  const NoData({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        80.verticalSpace,
        UniversalImage(Constants.noData),
        20.verticalSpace,
        Text(text ?? 'No Data', style: context.textTheme.displayMedium),
      ],
    );
  }
}
