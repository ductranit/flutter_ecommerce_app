import 'package:ecommerce_app/data/domain/api_responses.dart';
import 'package:ecommerce_app/data/services/rest_client.dart';
import 'package:ecommerce_app/domain/cart.dart';
import 'package:ecommerce_app/domain/product.dart';
import 'package:get/get.dart';

class ProductRepository {
  final restClient = Get.find<RestClient>();
  Future<List<Product>> getProducts() async {
    final response = await restClient.getProducts({});
    return response.data ?? [];
  }

  Future<BaseResponse> addProductToCart(int productId,
      {int quantity = 1}) async {
    return await restClient.addToCart(CartRequest(
      productId: productId,
      quantity: quantity,
    ));
  }

  Future<void> refreshCard(List<CartItem> items) async {
    await restClient.refreshCart(
      CartRefreshRequest(
        products: items,
      ),
    );
  }
}
