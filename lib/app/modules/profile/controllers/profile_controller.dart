import 'package:ecommerce_app/data/services/user_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final user = UserService.to.user;
}
