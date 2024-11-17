class ProductCategory {
  int? id;
  String? name;
  String? icon;
  String? iconImage;
  int? isFeatured;
  int? parentId;
  String? slug;
  ImageCategorySizes? imageWithSizes;

  ProductCategory({
    this.id,
    this.name,
    this.icon,
    this.iconImage,
    this.isFeatured,
    this.parentId,
    this.slug,
    this.imageWithSizes,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'] as int?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      iconImage: json['icon_image'] as String?,
      isFeatured: json['is_featured'] as int?,
      parentId: json['parent_id'] as int?,
      slug: json['slug'] as String?,
      imageWithSizes: json['image_with_sizes'] != null
          ? ImageCategorySizes.fromJson(json['image_with_sizes'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'icon_image': iconImage,
      'is_featured': isFeatured,
      'parent_id': parentId,
      'slug': slug,
      'image_with_sizes': imageWithSizes?.toJson(),
    };
  }
}

class ImageCategorySizes {
  String? origin;
  String? thumb;
  String? medium;
  String? small;

  ImageCategorySizes({
    this.origin,
    this.thumb,
    this.medium,
    this.small,
  });

  factory ImageCategorySizes.fromJson(Map<String, dynamic> json) {
    return ImageCategorySizes(
      origin: json['origin'] as String?,
      thumb: json['thumb'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'origin': origin,
      'thumb': thumb,
      'medium': medium,
      'small': small,
    };
  }
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? description;
  List<Category>? children;
  Category? parent;

  Category({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.children,
    this.parent,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e))
          .toList(),
      parent: json['parent'] != null ? Category.fromJson(json['parent']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'children': children?.map((e) => e.toJson()).toList(),
      'parent': parent?.toJson(),
    };
  }
}
