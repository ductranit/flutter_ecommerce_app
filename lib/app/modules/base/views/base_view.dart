import 'package:ecommerce_app/app/modules/categories/views/categories_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';

import '../../../../utils/constants.dart';
import '../controllers/base_controller.dart';
import '../../cart/views/cart_view.dart';
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
              FavoritesView(),
              CartView(),
              CaetgoriesView(),
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
              elevation: 0.0,
              backgroundColor: theme.scaffoldBackgroundColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0.0,
              items: [
                _mBottomNavItem(
                  label: 'Home'.tr,
                  icon: Constants.homeIcon,
                  iconData: Icons.store,
                ),
                _mBottomNavItem(
                  label: 'Favorites'.tr,
                  icon: Constants.favoritesIcon,
                  iconData: Icons.favorite,
                ),
                _mBottomNavItem(
                  label: 'Cart'.tr,
                  icon: Constants.cartIcon,
                  iconData: Icons.shopping_cart,
                ),
                _mBottomNavItem(
                    label: 'Categories'.tr,
                    icon: Constants.categoriesIcon,
                    iconData: Icons.category),
                _mBottomNavItem(
                  label: 'Settings'.tr,
                  icon: Constants.settingsIcon,
                  iconData: Icons.settings,
                ),
              ],
              onTap: controller.changeScreen,
            ),
          ),
        ),
      ),
    );
  }

  _mBottomNavItem(
      {required String label, required String icon, IconData? iconData}) {
    final iconWidget = iconData != null
        ? UniversalImage.icon(iconData, color: Get.theme.iconTheme.color)
        : UniversalImage(icon, color: Get.theme.iconTheme.color);
    final activeIcon = iconData != null
        ? UniversalImage.icon(iconData, color: Get.theme.primaryColor)
        : UniversalImage(icon, color: Get.theme.primaryColor);
    return BottomNavigationBarItem(
      label: label,
      icon: iconWidget,
      activeIcon: activeIcon,
    );
  }
}
