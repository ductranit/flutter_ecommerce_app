import 'package:ecommerce_app/data/services/product_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';

class CartController extends GetxController {
  // to hold the products in cart
  final cart = ProductService.to.cart;

  // to hold the total price of the cart products
  var total = ProductService.to.cartPrice;

  /// when the user press on purchase now button
  onPurchaseNowPressed() async {
    // create cart order
    final cartId = ProductService.to.cart.value.id;
    if (cartId.isNotEmpty) {
      final checkoutUrl = dotenv.get('CHECKOUT_URL', fallback: '');
      Get.toNamed('/checkout', arguments: '$checkoutUrl/$cartId');
    }
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
