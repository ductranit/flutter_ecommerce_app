import 'package:ecommerce_app/app/data/models/product_model.dart';
import 'package:ecommerce_app/data/domain/api_responses.dart';
import 'package:collection/collection.dart';

class CartModel {
  var id = '';
  var count = 0;
  var totalPrice = '';
  List<CartItem> cartItems = [];

  CartModel();
  CartModel.fromResponse(CartResponse response, List<ProductModel> products) {
    id = response.id;
    count = response.count;
    totalPrice = response.totalPrice;
    for (var item in response.content.entries) {
      cartItems.add(CartItem(
        productId: item.value.id,
        quantity: item.value.qty,
        product:
            products.firstWhereOrNull((element) => element.id == item.value.id),
      ));
    }
  }
}

class CartItem {
  int productId = 0;
  int quantity = 0;
  ProductModel? product;

  CartItem({
    this.productId = 0,
    this.quantity = 0,
    this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['product_id'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
    };
  }
}
