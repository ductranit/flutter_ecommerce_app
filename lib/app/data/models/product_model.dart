import 'package:ecommerce_app/domain/product.dart';

class ProductModel {
  int? id;
  String? image;
  String? name;
  int? quantity;
  double? price;
  String? size;
  bool isFavorite = false;
  ProductModel(
      {this.id,
      this.image,
      this.name,
      this.quantity,
      this.price,
      this.size,
      this.isFavorite = false});

  ProductModel.from(Product product) {
    id = product.id;
    name = product.name;
    quantity = product.quantity;
    price = product.price;
    image = product.imageUrl;
    size = 'M';
  }
}
