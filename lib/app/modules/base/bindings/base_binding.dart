import 'package:ecommerce_app/app/modules/categories/controllers/categories_controller.dart';
import 'package:get/get.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../favorites/controllers/favorites_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../notifications/controllers/notifications_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/base_controller.dart';

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
  }
}
