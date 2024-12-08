import 'package:ecommerce_app/app/data/models/cart_model.dart';
import 'package:ecommerce_app/app/data/models/product_model.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:get/get.dart';

class ProductService extends GetxService {
  static ProductService get to => Get.find();
  final productRepository = Get.find<ProductRepository>();

  final favoriteProducts = <ProductModel>[].obs;
  var allProducts = <ProductModel>[].obs;
  final cartPrice = 0.0.obs;
  final cart = CartModel().obs;

  Future<void> loadProducts() async {
    final response = await productRepository.getProducts();
    allProducts.value = response.map((e) => ProductModel.from(e)).toList();
  }

  Future<void> addToCart(ProductModel product, int quantity) async {
    // add product to cart if not exist
    final cartItem = cart.value.cartItems
        .firstWhereOrNull((item) => item.productId == product.id);
    if (cartItem == null) {
      cart.value.cartItems.add(CartItem(
        productId: product.id!,
        quantity: quantity,
        product: product,
      ));
    } else {
      cartItem.quantity += quantity;
    }

    refreshCart();
  }

  void refreshCart() {
    cart.value.cartItems.removeWhere((item) => item.quantity <= 0);
    cartPrice.value = cart.value.cartItems.isEmpty
        ? 0.0
        : cart.value.cartItems
            .map((item) => item.product!.price! * item.quantity)
            .reduce((value, element) => value + element);
  }

  void removeFromCart(ProductModel product) {
    refreshCart();
  }

  void increaseCart(ProductModel product, int quantity) {
    final cartItem = cart.value.cartItems
        .firstWhereOrNull((item) => item.productId == product.id);
    if (cartItem != null) {
      cartItem.quantity += quantity;
    }
    refreshCart();
  }

  void decreaseCart(ProductModel product, int quantity) {
    final cartItem = cart.value.cartItems
        .firstWhereOrNull((item) => item.productId == product.id);
    if (cartItem != null) {
      cartItem.quantity -= quantity;
    }
    refreshCart();
  }

  void addToFavorite(ProductModel product) {
    favoriteProducts.add(product);
  }

  void removeFromFavorite(ProductModel product) {
    favoriteProducts.remove(product);
  }

  void addOrRemoveFavorite(ProductModel product) {
    final favoriteProduct =
        favoriteProducts.firstWhereOrNull((item) => item.id == product.id);
    if (favoriteProduct == null) {
      addToFavorite(product);
    } else {
      removeFromFavorite(product);
    }
  }

  bool isFavorite(ProductModel product) {
    return favoriteProducts.any((item) => item.id == product.id);
  }
}
