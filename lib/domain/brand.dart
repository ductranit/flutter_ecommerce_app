class Brand {
  int? id;
  String? slug;
  String? name;
  String? description;
  String? image;

  Brand({
    this.id,
    this.slug,
    this.name,
    this.description,
    this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
