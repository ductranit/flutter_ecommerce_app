import 'package:ecommerce_app/data/services/rest_client.dart';
import 'package:ecommerce_app/domain/product.dart';
import 'package:get/get.dart';

class ProductRepository {
  final restClient = Get.find<RestClient>();
  Future<List<Product>> getProducts() async {
    final response = await restClient.getProducts({});
    return response.data ?? [];
  }
}
