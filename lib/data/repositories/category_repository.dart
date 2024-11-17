import 'package:ecommerce_app/domain/category.dart';
import 'package:get/get.dart';

import '../services/rest_client.dart';

class CategoryRepository {
  final restClient = Get.find<RestClient>();
  Future<List<Category>> getAllCategories() async {
    final response = await restClient.getCategories();
    return response.data ?? [];
  }
}
