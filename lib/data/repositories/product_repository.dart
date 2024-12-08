import 'package:ecommerce_app/app/data/models/cart_model.dart';
import 'package:ecommerce_app/data/domain/api_responses.dart';
import 'package:ecommerce_app/data/services/rest_client.dart';
import 'package:ecommerce_app/domain/product.dart';
import 'package:get/get.dart';

class ProductRepository {
  final restClient = Get.find<RestClient>();
  Future<List<Product>> getProducts() async {
    final response = await restClient.getProducts({});
    return response.data ?? [];
  }

  Future<ProductListResponse> getCategoryProducts(int categoryId) async {
    final response = await restClient.getProductsByCategory(categoryId);
    return response;
  }

  Future<CartResponse> addProductToCart(int productId,
      {int quantity = 1}) async {
    return await restClient.addToCart(CartRequest(
      productId: productId,
      quantity: quantity,
    ));
  }

  Future<CartResponse> refreshCard(CartModel cart) async {
    return await restClient.getCard(cart.id);
  }

  Future<CartResponse> createCartCheckout(
      List<int> productIds, List<int> quantities) async {
    return await restClient.createCart(
        CreateCartRequest(productIds: productIds, quantities: quantities));
  }
}
