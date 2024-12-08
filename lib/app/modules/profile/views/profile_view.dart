import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = context.theme;
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100.h),
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: baseTheme.primaryColor,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.r),
                            child: UniversalImage(
                              controller.user.value?.avatar ?? '',
                              fit: BoxFit.contain,
                              width: 300.w,
                              height: 300.h,
                            ),
                          ),
                        ),
                      )
                    ]),
              )),
          Positioned(
              left: 20,
              top: 50,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: UniversalImage(
                  Icons.close,
                  height: 50,
                  width: 50,
                  color: baseTheme.secondaryHeaderColor,
                ),
              ))
        ],
      ),
    );
  }
}
