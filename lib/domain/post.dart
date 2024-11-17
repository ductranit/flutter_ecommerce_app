import 'package:ecommerce_app/domain/category.dart';
import 'package:ecommerce_app/domain/tag.dart';

class Post {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? image;
  List<Category>? categories;
  List<Tag>? tags;
  String? createdAt;
  String? updatedAt;

  Post({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.image,
    this.categories,
    this.tags,
    this.createdAt,
    this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e))
          .toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'image': image,
      'categories': categories?.map((e) => e.toJson()).toList(),
      'tags': tags?.map((e) => e.toJson()).toList(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
