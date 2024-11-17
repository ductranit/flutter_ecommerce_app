import 'package:ecommerce_app/domain/category.dart';
import 'package:get/get.dart';

import '../services/rest_client.dart';

class CategoryRepository {
  final restClient = Get.find<RestClient>();
  Future<List<ProductCategory>> getAllCategories() async {
    final response = await restClient.getProductCategories({});
    return response.data ?? [];
  }
}
