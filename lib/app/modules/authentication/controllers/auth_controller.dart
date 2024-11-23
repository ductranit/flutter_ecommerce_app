import 'package:ecommerce_app/data/services/user_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final loginMode = true.obs;
  Future<String?> login(String email, String password) async {
    return UserService.to.login(email, password);
  }

  Future<String?> signUp(String name, String email, String password,
      String passwordConfirmation) async {
    return UserService.to.signUp(name, email, password, passwordConfirmation);
  }

  Future<String?> forgotPassword(String email) async {
    return UserService.to.forgotPassword(email);
  }
}
