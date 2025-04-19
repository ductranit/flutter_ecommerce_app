import 'package:ecommerce_app/data/services/product_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final products = ProductService.to.allProducts;
  final categories = ProductService.to.allCategories;
  var currentPage = 0.obs;
  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  getProducts() async {
    ProductService.to.loadProducts();
    ProductService.to.loadCategories();
  }
}
