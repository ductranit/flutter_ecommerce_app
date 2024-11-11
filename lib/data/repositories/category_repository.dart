import 'package:ecommerce_app/data/domain/api_responses.dart';
import 'package:get/get.dart';

import '../services/rest_client.dart';

class CategoryRepository {
  Future<List<Category>> getAllCategories() async {
    final restClient = Get.find<RestClient>();
    final response = await restClient.getCategories();
    return response.data ?? [];
  }
}
