import 'package:ecommerce_app/data/services/user_service.dart';
import 'package:get/get.dart';

enum ProfileViewMode { profile, password, address }

class ProfileController extends GetxController {
  final user = UserService.to.user;
  final mode = ProfileViewMode.profile.obs;

  void updateUser(String name, String email, String phone) {
    user.value?.name = name;
    user.value?.email = email;
    user.value?.phone = phone;
    UserService.to.update();
    Get.back();
  }
}
