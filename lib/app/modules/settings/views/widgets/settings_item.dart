import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';

import '../../../../../utils/constants.dart';
import '../../controllers/settings_controller.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isDark;
  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return ListTile(
      title: Text(title,
          style: theme.textTheme.displayMedium?.copyWith(
            fontSize: 16.sp,
          )),
      subtitle: null,
      leading: CircleAvatar(
        radius: 25.r,
        backgroundColor: theme.primaryColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: UniversalImage(icon, fit: BoxFit.none),
        ),
      ),
      trailing: isDark
          ? GetBuilder<SettingsController>(
              id: 'Theme',
              builder: (controller) => CupertinoSwitch(
                value: !controller.isLightTheme,
                onChanged: controller.changeTheme,
                activeColor: theme.primaryColor,
              ),
            )
          : Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child:
                  UniversalImage(Constants.forwardArrowIcon, fit: BoxFit.none),
            ),
    );
  }
}
