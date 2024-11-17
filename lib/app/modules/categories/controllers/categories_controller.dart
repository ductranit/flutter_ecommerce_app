import 'package:ecommerce_app/app/data/models/category_model.dart';
import 'package:ecommerce_app/data/repositories/category_repository.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  var categories = <CategoryModel>[].obs;
  final categoryRepository = Get.find<CategoryRepository>();

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  getProducts() async {
    final response = await categoryRepository.getAllCategories();
    final list = response.map((e) => CategoryModel.from(e)).toList();
    categories.value = CategoryModel.organizeCategories(list);
  }
}
