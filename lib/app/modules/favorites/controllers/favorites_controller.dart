import 'package:ecommerce_app/data/services/product_service.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final favoriteProducts = ProductService.to.favoriteProducts;
}
