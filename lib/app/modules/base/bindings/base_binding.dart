import 'package:ecommerce_app/app/modules/authentication/controllers/auth_controller.dart';
import 'package:ecommerce_app/app/modules/base/controllers/base_controller.dart';
import 'package:ecommerce_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:ecommerce_app/app/modules/categories/controllers/categories_controller.dart';
import 'package:ecommerce_app/app/modules/category_products/controllers/category_details_controller.dart';
import 'package:ecommerce_app/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:ecommerce_app/app/modules/home/controllers/home_controller.dart';
import 'package:ecommerce_app/app/modules/notifications/controllers/notifications_controller.dart';
import 'package:ecommerce_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:ecommerce_app/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    Get.lazyPut<CategoriesController>(() => CategoriesController());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<CategoryDetailsController>(() => CategoryDetailsController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
