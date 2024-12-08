import 'package:ecommerce_app/data/services/product_service.dart';
import 'package:get/get.dart';

import '../../../components/custom_snackbar.dart';
import '../../../data/models/product_model.dart';
import '../../base/controllers/base_controller.dart';

class CartController extends GetxController {
  // to hold the products in cart
  final cart = ProductService.to.cart;

  // to hold the total price of the cart products
  var total = ProductService.to.cartPrice;

  /// when the user press on purchase now button
  onPurchaseNowPressed() {
    Get.find<BaseController>().changeScreen(0);
    CustomSnackBar.showCustomSnackBar(
        title: 'Purchased', message: 'Order placed with success');
  }

  /// when the user press on increase button
  onIncreasePressed(ProductModel product) {
    ProductService.to.increaseCart(product, 1);
  }

  /// when the user press on decrease button
  onDecreasePressed(ProductModel product) {
    ProductService.to.decreaseCart(product, 1);
  }

  /// when the user press on delete icon
  onDeletePressed(ProductModel product) {
    ProductService.to.removeFromCart(product);
  }
}
