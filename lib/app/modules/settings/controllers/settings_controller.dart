import 'package:ecommerce_app/app/data/local/my_shared_pref.dart';
import 'package:ecommerce_app/config/theme/my_theme.dart';
import 'package:ecommerce_app/data/services/user_service.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  // get is light theme from shared pref
  var isLightTheme = MySharedPref.getThemeIsLight();

  @override
  void onInit() {
    super.onInit();
    UserService.to.checkAuthStatus();
  }

  /// change the system theme
  changeTheme(bool value) {
    MyTheme.changeTheme();
    isLightTheme = MySharedPref.getThemeIsLight();
    update(['Theme']);
  }
}
