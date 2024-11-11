import 'package:ecommerce_app/data/services/rest_client.dart';
import 'package:ecommerce_app/domain/product.dart';
import 'package:get/get.dart';

class ProductRepository {
  Future<List<Product>> getProducts() async {
    final restClient = Get.find<RestClient>();
    final response = await restClient.getProducts({});
    return response.data ?? [];
  }
}
