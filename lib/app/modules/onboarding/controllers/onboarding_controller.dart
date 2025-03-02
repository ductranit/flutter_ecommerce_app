import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.offNamed(Routes.START);
    super.onInit();
  }
}
