class Product {
  int? id;
  String? slug;
  String? name;
  String? sku;
  String? description;
  String? content;
  int? quantity;
  bool? isOutOfStock;
  String? stockStatusLabel;
  String? stockStatusHtml;
  double? price;
  String? priceFormatted;
  double? originalPrice;
  String? originalPriceFormatted;
  double? reviewsAvg;
  int? reviewsCount;
  ImageSizes? imageWithSizes;
  double? weight;
  double? height;
  double? wide;
  double? length;
  String? imageUrl;
  List<dynamic>? productOptions;
  Store? store;

  Product({
    this.id,
    this.slug,
    this.name,
    this.sku,
    this.description,
    this.content,
    this.quantity,
    this.isOutOfStock,
    this.stockStatusLabel,
    this.stockStatusHtml,
    this.price,
    this.priceFormatted,
    this.originalPrice,
    this.originalPriceFormatted,
    this.reviewsAvg,
    this.reviewsCount,
    this.imageWithSizes,
    this.weight,
    this.height,
    this.wide,
    this.length,
    this.imageUrl,
    this.productOptions,
    this.store,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      quantity: json['quantity'] as int?,
      isOutOfStock: json['is_out_of_stock'] as bool?,
      stockStatusLabel: json['stock_status_label'] as String?,
      stockStatusHtml: json['stock_status_html'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      priceFormatted: json['price_formatted'] as String?,
      originalPrice: (json['original_price'] as num?)?.toDouble(),
      originalPriceFormatted: json['original_price_formatted'] as String?,
      reviewsAvg: (json['reviews_avg'] as num?)?.toDouble(),
      reviewsCount: json['reviews_count'] as int?,
      imageWithSizes: json['image_with_sizes'] != null
          ? ImageSizes.fromJson(json['image_with_sizes'])
          : null,
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      wide: (json['wide'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      imageUrl: json['image_url'] as String?,
      productOptions: json['product_options'] as List<dynamic>?,
      store: json['store'] != null ? Store.fromJson(json['store']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'name': name,
      'sku': sku,
      'description': description,
      'content': content,
      'quantity': quantity,
      'is_out_of_stock': isOutOfStock,
      'stock_status_label': stockStatusLabel,
      'stock_status_html': stockStatusHtml,
      'price': price,
      'price_formatted': priceFormatted,
      'original_price': originalPrice,
      'original_price_formatted': originalPriceFormatted,
      'reviews_avg': reviewsAvg,
      'reviews_count': reviewsCount,
      'image_with_sizes': imageWithSizes?.toJson(),
      'weight': weight,
      'height': height,
      'wide': wide,
      'length': length,
      'image_url': imageUrl,
      'product_options': productOptions,
      'store': store?.toJson(),
    };
  }
}

class ImageSizes {
  List<String>? origin;
  List<String>? thumb;
  List<String>? medium;
  List<String>? small;

  ImageSizes({
    this.origin,
    this.thumb,
    this.medium,
    this.small,
  });

  factory ImageSizes.fromJson(Map<String, dynamic> json) {
    return ImageSizes(
      origin:
          (json['origin'] as List<dynamic>?)?.map((e) => e as String).toList(),
      thumb:
          (json['thumb'] as List<dynamic>?)?.map((e) => e as String).toList(),
      medium:
          (json['medium'] as List<dynamic>?)?.map((e) => e as String).toList(),
      small:
          (json['small'] as List<dynamic>?)?.map((e) => e as String).toList(),
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

class Store {
  int? id;
  String? slug;
  String? name;

  Store({
    this.id,
    this.slug,
    this.name,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'name': name,
    };
  }
}
