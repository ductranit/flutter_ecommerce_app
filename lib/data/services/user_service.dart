import 'package:ecommerce_app/app/data/local/my_shared_pref.dart';
import 'package:ecommerce_app/data/domain/api_responses.dart';
import 'package:ecommerce_app/data/repositories/user_repository.dart';
import 'package:ecommerce_app/domain/user.dart';
import 'package:ecommerce_app/utils/ext.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  final _isSignedIn = false.obs;
  final _user = Rxn<UserProfile>();

  bool get isSignedIn => _isSignedIn.value;
  UserProfile? get user => _user.value;
  final userRepository = Get.find<UserRepository>();

  Future<void> init() async {
    await checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    try {
      final storedUser = MySharedPref.getAuthToken();
      if (storedUser != null) {
        _isSignedIn.safeUpdate(true);

        await getUserProfile();
      }
    } catch (e) {
      Get.find<Logger>().e('Error while checking auth status: $e');
    }
  }

  Future<String?> login(String email, String password) async {
    final response = await userRepository.login(email, password);
    if (response.error == true) {
      return response.message ?? '';
    }

    MySharedPref.setAuthToken(response.data?.token ?? '');
    _isSignedIn.safeUpdate(true);
    getUserProfile();
    return null;
  }

  Future<String?> signUp(String name, String email, String password,
      String passwordConfirmation) async {
    final response = await userRepository.register(RegisterRequest(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    ));

    if (response.error == true) {
      return response.message ?? '';
    }
    return null;
  }

  Future<String?> forgotPassword(String email) async {
    final response = await userRepository.forgotPassword(ForgotPasswordRequest(
      email: email,
    ));

    if (response.error == true) {
      return response.message ?? '';
    }
    return null;
  }

  Future<void> getUserProfile() async {
    final response = await userRepository.getUserProfile();
    if (response.error == true) {
      return;
    }

    _user.safeUpdate(response.data);
  }

  Future<void> logout() async {
    userRepository.logout();
    MySharedPref.removeAuthToken();
    _user.safeUpdate(null);
    _isSignedIn.safeUpdate(false);
  }
}
