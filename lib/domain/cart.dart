import 'package:ecommerce_app/app/data/models/product_model.dart';

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
