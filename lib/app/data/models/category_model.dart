import 'package:ecommerce_app/domain/category.dart';

class CategoryModel {
  int? id;
  String? name;
  String? slug;
  int parentId = 0;
  List<CategoryModel> children = [];

  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.parentId = 0,
    this.children = const [],
  });

  CategoryModel.from(ProductCategory category) {
    id = category.id;
    name = category.name;
    slug = category.slug;
    parentId = category.parentId ?? 0;
  }

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parentId = json['parent_id'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['parent_id'] = parentId;
    return data;
  }

  static List<CategoryModel> organizeCategories(
      List<CategoryModel> categories) {
    // Create a copy of the list to avoid modifying the original while iterating
    List<CategoryModel> organizedCategories = List.from(categories);

    // First pass: Add children to their parent categories
    for (var category in categories) {
      if (category.parentId > 0) {
        // Find parent category
        var parentCategory = categories.firstWhere(
          (parent) => parent.id == category.parentId,
          orElse: () =>
              CategoryModel(), // Return empty model if parent not found
        );

        // If parent exists, add this category as a child
        if (parentCategory.id != null) {
          // Check if child already exists in parent's children
          bool childExists =
              parentCategory.children.any((child) => child.id == category.id);
          if (!childExists) {
            parentCategory.children.add(category);
          }
        }
      }
    }

    // Second pass: Remove categories that are children (have parentId)
    organizedCategories.removeWhere((category) => category.parentId > 0);

    return organizedCategories;
  }
}
