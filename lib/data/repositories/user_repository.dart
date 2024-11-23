import 'package:ecommerce_app/data/domain/api_responses.dart';
import 'package:ecommerce_app/data/services/rest_client.dart';
import 'package:get/get.dart';

class UserRepository {
  final restClient = Get.find<RestClient>();

  Future<LoginResponse> login(String email, String password) async {
    return await restClient
        .login(LoginRequest(email: email, password: password));
  }

  Future<BaseResponse> register(RegisterRequest request) async {
    return await restClient.register(request);
  }

  Future<BaseResponse> forgotPassword(ForgotPasswordRequest request) async {
    return await restClient.forgotPassword(request);
  }

  Future<UserProfileResponse> getUserProfile() async {
    return await restClient.getProfile();
  }

  Future<bool> logout() async {
    final response = await restClient.logout();
    return response.error != true;
  }
}
