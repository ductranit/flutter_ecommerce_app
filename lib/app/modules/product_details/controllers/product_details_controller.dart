import 'package:ecommerce_app/data/services/product_service.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';
import '../../base/controllers/base_controller.dart';

class ProductDetailsController extends GetxController {
  // get product details from arguments
  ProductModel product = Get.arguments;

  // for the product size
  var selectedSize = 'M';

  /// when the user press on the favorite button
  onFavoriteButtonPressed() {
    Get.find<BaseController>().onFavoriteButtonPressed(product);
    update(['FavoriteButton']);
  }

  /// when the user press on add to cart button
  onAddToCartPressed() {
    product.size = selectedSize;
    ProductService.to.addToCart(product, 1);

    Get.back();
  }

  /// change the selected size
  changeSelectedSize(String size) {
    if (size == selectedSize) return;
    selectedSize = size;
    update(['Size']);
  }

  bool isFavorite() {
    return ProductService.to.isFavorite(product);
  }
}
