import 'package:ecommerce_app/app/data/models/product_model.dart';
import 'package:ecommerce_app/data/services/product_service.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  // current screen index
  int currentIndex = 0;

  /// change the selected screen index
  changeScreen(int selectedIndex) {
    currentIndex = selectedIndex;
    update();
  }

  /// when the user press on the favorite button in the product
  void onFavoriteButtonPressed(ProductModel product) {
    ProductService.to.addOrRemoveFavorite(product);
    update(['FavoriteButton']);
  }

  bool isFavorite(ProductModel product) {
    return ProductService.to.isFavorite(product);
  }

  void addToCart(ProductModel product, int quantity) {
    ProductService.to.addToCart(product, quantity);
  }
}
