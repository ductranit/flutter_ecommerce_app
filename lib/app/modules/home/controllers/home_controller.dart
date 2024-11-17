import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  var products = <ProductModel>[].obs;
  final productRepository = Get.find<ProductRepository>();

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  getProducts() async {
    final response = await productRepository.getProducts();
    products.value = response.map((e) => ProductModel.from(e)).toList();
  }
}
