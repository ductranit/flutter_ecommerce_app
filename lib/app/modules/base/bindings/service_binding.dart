import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/configs.dart';
import 'package:ecommerce_app/data/services/rest_client.dart';
import 'package:get/get.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClient>(() => RestClient(Dio(), baseUrl: baseUrl));
  }
}
