import 'package:ecommerce_app/app/data/models/product_model.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/domain/cart.dart';
import 'package:get/get.dart';

class ProductService extends GetxService {
  static ProductService get to => Get.find();
  final productRepository = Get.find<ProductRepository>();

  final cartItems = <CartItem>[].obs;
  final favoriteProducts = <ProductModel>[].obs;
  var allProducts = <ProductModel>[].obs;
  final cartPrice = 0.0.obs;

  Future<void> loadProducts() async {
    final response = await productRepository.getProducts();
    allProducts.value = response.map((e) => ProductModel.from(e)).toList();
  }

  void addToCart(ProductModel product, int quantity) {
    // add product to cart if not exist
    final cartItem =
        cartItems.firstWhereOrNull((item) => item.productId == product.id);
    if (cartItem == null) {
      cartItems.add(CartItem(
        productId: product.id!,
        quantity: quantity,
        product: product,
      ));
    } else {
      cartItem.quantity += quantity;
    }

    productRepository.addProductToCart(product.id!, quantity: quantity);
    calculateCartPrice();
  }

  void calculateCartPrice() {
    cartItems.removeWhere((item) => item.quantity <= 0);
    cartPrice.value = cartItems.isEmpty
        ? 0.0
        : cartItems
            .map((item) => item.product!.price! * item.quantity)
            .reduce((value, element) => value + element);
  }

  void removeFromCart(ProductModel product) {
    cartItems.removeWhere((item) => item.productId == product.id);
    calculateCartPrice();
  }

  void increaseCart(ProductModel product, int quantity) {
    final cartItem =
        cartItems.firstWhereOrNull((item) => item.productId == product.id);
    if (cartItem != null) {
      cartItem.quantity += quantity;
    }
    calculateCartPrice();
  }

  void decreaseCart(ProductModel product, int quantity) {
    final cartItem =
        cartItems.firstWhereOrNull((item) => item.productId == product.id);
    if (cartItem != null) {
      cartItem.quantity -= quantity;
    }
    calculateCartPrice();
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
