import 'package:ecommerce_app/data/configs.dart';
import 'package:ecommerce_app/data/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/constants.dart';
import '../../../components/screen_title.dart';
import '../../../routes/app_pages.dart';
import '../controllers/settings_controller.dart';
import 'widgets/settings_item.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            30.verticalSpace,
            const ScreenTitle(
              title: 'Settings',
              dividerEndIndent: 230,
            ),
            20.verticalSpace,
            Text('Account',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
            20.verticalSpace,
            Obx(() {
              final isSignedIn = UserService.to.isSignedIn;
              final user = UserService.to.user.value;
              final userName = user?.name ?? '';
              final avatar = user?.avatar ?? '';
              return GestureDetector(
                onTap: () => isSignedIn && user != null
                    ? Get.toNamed(Routes.PROFILE)
                    : Get.toNamed(Routes.AUTH),
                child: SettingsItem(
                  title: !isSignedIn ? 'Sign in' : userName,
                  icon: avatar.isNotEmpty ? avatar : Constants.userIcon,
                ),
              );
            }),
            30.verticalSpace,
            Text('Settings',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
            20.verticalSpace,
            const SettingsItem(
              title: 'Dark Mode',
              icon: Constants.themeIcon,
              isDark: true,
            ),
            25.verticalSpace,
            GestureDetector(
              onTap: () => launchUrl(Uri.parse(baseUrl)),
              child: const SettingsItem(
                title: 'Help',
                icon: Constants.helpIcon,
              ),
            ),
            25.verticalSpace,
            Obx(() => Visibility(
                visible: UserService.to.isSignedIn,
                child: GestureDetector(
                  onTap: () => UserService.to.logout(),
                  child: const SettingsItem(
                    title: 'Sign Out',
                    icon: Constants.logoutIcon,
                  ),
                ))),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
