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
