import 'package:ecommerce_app/app/data/models/category_model.dart';
import 'package:ecommerce_app/app/data/models/product_model.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:get/get.dart';

class CategoryDetailsController extends GetxController {
  // get category details from arguments
  CategoryModel category = Get.arguments;
  final products = <ProductModel>[].obs;
  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  getProducts() async {
    final productRepository = Get.find<ProductRepository>();
    final response =
        await productRepository.getCategoryProducts(category.id ?? 0);
    final categoryProducts = response.data ?? [];
    products.value = categoryProducts.map((e) => ProductModel.from(e)).toList();
  }
}
