import 'package:ecommerce_app/app/modules/categories/views/categories_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';

import '../controllers/base_controller.dart';
import '../../favorites/views/favorites_view.dart';
import '../../home/views/home_view.dart';
import '../../settings/views/settings_view.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = context.theme;
    return GetBuilder<BaseController>(
      builder: (_) => Scaffold(
        extendBody: true,
        body: SafeArea(
          bottom: false,
          child: IndexedStack(
            index: controller.currentIndex,
            children: const [
              HomeView(),
              CaetgoriesView(),
              FavoritesView(),
              SettingsView()
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              type: BottomNavigationBarType.fixed,
              elevation: 10.0,
              backgroundColor: theme.scaffoldBackgroundColor,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedFontSize: 0.0,
              selectedLabelStyle: theme.textTheme.bodySmall,
              unselectedLabelStyle: theme.textTheme.bodySmall,
              items: [
                _mBottomNavItem(
                  label: 'Home'.tr,
                  iconData: Icons.store,
                ),
                _mBottomNavItem(label: 'Category'.tr, iconData: Icons.menu),
                _mBottomNavItem(
                  label: 'Wistlist'.tr,
                  iconData: Icons.favorite_border_outlined,
                ),
                _mBottomNavItem(
                  label: 'Profile'.tr,
                  iconData: Icons.person,
                ),
              ],
              onTap: controller.changeScreen,
            ),
          ),
        ),
      ),
    );
  }

  _mBottomNavItem({required String label, required IconData iconData}) {
    final iconWidget =
        UniversalImage(iconData, color: Get.theme.iconTheme.color);
    final activeIcon = UniversalImage(iconData, color: Get.theme.primaryColor);
    return BottomNavigationBarItem(
      label: label,
      icon: iconWidget,
      activeIcon: activeIcon,
    );
  }
}
