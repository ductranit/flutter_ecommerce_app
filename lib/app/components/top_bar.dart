import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:universal_image/universal_image.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const TopBar({super.key, required this.title, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                width: 60.w,
              ),
            ),
            title: Text(title),
            actions: actions,
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.blue, // Navigation bar
              statusBarColor: Colors.pink, // Status bar
            ),
          ),
          SizedBox(
            width: 320.w,
            height: 40.h,
            child: SearchBar(
              shape: WidgetStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
              trailing: [
                UniversalImage(
                  Icons.search_outlined,
                  size: 24.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
