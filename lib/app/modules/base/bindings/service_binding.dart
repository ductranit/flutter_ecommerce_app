import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/data/local/my_shared_pref.dart';
import 'package:ecommerce_app/data/configs.dart';
import 'package:ecommerce_app/data/repositories/category_repository.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/data/repositories/user_repository.dart';
import 'package:ecommerce_app/data/services/product_service.dart';
import 'package:ecommerce_app/data/services/rest_client.dart';
import 'package:ecommerce_app/data/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClient>(() => RestClient(
        Dio()
          ..interceptors.add(InterceptorsWrapper(
            onRequest: (options, handler) {
              options.headers["Content-Type"] = "application/json";
              options.headers["Accept"] = "application/json";
              final token = MySharedPref.getAuthToken();
              if (token?.isNotEmpty == true) {
                options.headers["Authorization"] = "Bearer $token";
              }
              return handler.next(options);
            },
            onResponse: (response, handler) {
              if (response.statusCode == 401) {
                debugPrint('token expired!');
                MySharedPref.removeAuthToken();
              }

              return handler.next(response);
            },
          )),
        baseUrl: baseUrl));

    Get.lazyPut<ProductRepository>(() => ProductRepository());
    Get.lazyPut<CategoryRepository>(() => CategoryRepository());
    Get.lazyPut<UserRepository>(() => UserRepository());
    Get.lazyPut<Logger>(() => Logger());
    Get.lazyPut<UserService>(() => UserService());
    Get.lazyPut<ProductService>(() => ProductService());
  }
}
