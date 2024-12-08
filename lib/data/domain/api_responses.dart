// Models

import 'package:ecommerce_app/app/data/models/cart_model.dart';
import 'package:ecommerce_app/domain/address.dart';
import 'package:ecommerce_app/domain/brand.dart';
import 'package:ecommerce_app/domain/category.dart';
import 'package:ecommerce_app/domain/country.dart';
import 'package:ecommerce_app/domain/order.dart';
import 'package:ecommerce_app/domain/post.dart';
import 'package:ecommerce_app/domain/product.dart';
import 'package:ecommerce_app/domain/tag.dart';
import 'package:ecommerce_app/domain/user.dart';

class AddressRequest {
  String? name;
  String? email;
  String? phone;
  String? country;
  String? state;
  String? city;
  String? address;
  bool? isDefault;
  String? zipCode;

  AddressRequest({
    this.name,
    this.email,
    this.phone,
    this.country,
    this.state,
    this.city,
    this.address,
    this.isDefault,
    this.zipCode,
  });

  factory AddressRequest.fromJson(Map<String, dynamic> json) {
    return AddressRequest(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      isDefault: json['is_default'] as bool?,
      zipCode: json['zip_code'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'country': country,
      'state': state,
      'city': city,
      'address': address,
      'is_default': isDefault,
      'zip_code': zipCode,
    };
  }
}

class AddressResponse {
  bool? error;
  Address? data;
  String? message;

  AddressResponse({
    this.error,
    this.data,
    this.message,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      error: json['error'] as bool?,
      data: json['data'] != null ? Address.fromJson(json['data']) : null,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data?.toJson(),
      'message': message,
    };
  }
}

class CountryResponse {
  bool? error;
  List<Country>? data;
  String? message;

  CountryResponse({
    this.error,
    this.data,
    this.message,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) {
    return CountryResponse(
      error: json['error'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e))
          .toList(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data?.map((e) => e.toJson()).toList(),
      'message': message,
    };
  }
}

class BaseResponse {
  bool? error;
  dynamic data;
  String? message;

  BaseResponse({
    this.error,
    this.data,
    this.message,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      error: json['error'] as bool?,
      data: json['data'],
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data,
      'message': message,
    };
  }
}

class RegisterRequest {
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? passwordConfirmation;

  RegisterRequest({
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.passwordConfirmation,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'password_confirmation': passwordConfirmation,
    };
  }
}

class LoginRequest {
  String? email;
  String? password;

  LoginRequest({
    this.email,
    this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginResponse {
  bool? error;
  LoginData? data;
  String? message;

  LoginResponse({
    this.error,
    this.data,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      error: json['error'] as bool?,
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data?.toJson(),
      'message': message,
    };
  }
}

class LoginData {
  String? token;

  LoginData({
    this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}

class EmailCheckRequest {
  String? email;

  EmailCheckRequest({
    this.email,
  });

  factory EmailCheckRequest.fromJson(Map<String, dynamic> json) {
    return EmailCheckRequest(
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

class EmailCheckResponse {
  bool? error;
  EmailCheckData? data;
  String? message;

  EmailCheckResponse({
    this.error,
    this.data,
    this.message,
  });

  factory EmailCheckResponse.fromJson(Map<String, dynamic> json) {
    return EmailCheckResponse(
      error: json['error'] as bool?,
      data: json['data'] != null ? EmailCheckData.fromJson(json['data']) : null,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data?.toJson(),
      'message': message,
    };
  }
}

class EmailCheckData {
  bool? exists;

  EmailCheckData({
    this.exists,
  });

  factory EmailCheckData.fromJson(Map<String, dynamic> json) {
    return EmailCheckData(
      exists: json['exists'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exists': exists,
    };
  }
}

class ForgotPasswordRequest {
  String? email;

  ForgotPasswordRequest({
    this.email,
  });

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordRequest(
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

class ResendVerificationRequest {
  String? email;

  ResendVerificationRequest({
    this.email,
  });

  factory ResendVerificationRequest.fromJson(Map<String, dynamic> json) {
    return ResendVerificationRequest(
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

class SearchResponse {
  bool? error;
  List<Post>? data;
  String? message;

  SearchResponse({
    this.error,
    this.data,
    this.message,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      error: json['error'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e))
          .toList(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data?.map((e) => e.toJson()).toList(),
      'message': message,
    };
  }
}

class PostListResponse {
  List<Post>? data;
  PaginationLinks? links;
  PaginationMeta? meta;
  bool? error;
  String? message;

  PostListResponse({
    this.data,
    this.links,
    this.meta,
    this.error,
    this.message,
  });

  factory PostListResponse.fromJson(Map<String, dynamic> json) {
    return PostListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e))
          .toList(),
      links: json['links'] != null
          ? PaginationLinks.fromJson(json['links'])
          : null,
      meta: json['meta'] != null ? PaginationMeta.fromJson(json['meta']) : null,
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'links': links?.toJson(),
      'meta': meta?.toJson(),
      'error': error,
      'message': message,
    };
  }
}

class CategoryListResponse {
  List<Category>? data;
  PaginationLinks? links;
  PaginationMeta? meta;
  bool? error;
  String? message;

  CategoryListResponse({
    this.data,
    this.links,
    this.meta,
    this.error,
    this.message,
  });

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) {
    return CategoryListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e))
          .toList(),
      links: json['links'] != null
          ? PaginationLinks.fromJson(json['links'])
          : null,
      meta: json['meta'] != null ? PaginationMeta.fromJson(json['meta']) : null,
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'links': links?.toJson(),
      'meta': meta?.toJson(),
      'error': error,
      'message': message,
    };
  }
}

class TagListResponse {
  List<Tag>? data;
  PaginationLinks? links;
  PaginationMeta? meta;
  bool? error;
  String? message;

  TagListResponse({
    this.data,
    this.links,
    this.meta,
    this.error,
    this.message,
  });

  factory TagListResponse.fromJson(Map<String, dynamic> json) {
    return TagListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e))
          .toList(),
      links: json['links'] != null
          ? PaginationLinks.fromJson(json['links'])
          : null,
      meta: json['meta'] != null ? PaginationMeta.fromJson(json['meta']) : null,
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'links': links?.toJson(),
      'meta': meta?.toJson(),
      'error': error,
      'message': message,
    };
  }
}

class PostResponse {
  bool? error;
  Post? data;
  String? message;

  PostResponse({
    this.error,
    this.data,
    this.message,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      error: json['error'] as bool?,
      data: json['data'] != null ? Post.fromJson(json['data']) : null,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data?.toJson(),
      'message': message,
    };
  }
}

class BrandListResponse {
  List<Brand>? data;
  PaginationLinks? links;
  PaginationMeta? meta;
  bool? error;
  String? message;

  BrandListResponse({
    this.data,
    this.links,
    this.meta,
    this.error,
    this.message,
  });

  factory BrandListResponse.fromJson(Map<String, dynamic> json) {
    return BrandListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Brand.fromJson(e))
          .toList(),
      links: json['links'] != null
          ? PaginationLinks.fromJson(json['links'])
          : null,
      meta: json['meta'] != null ? PaginationMeta.fromJson(json['meta']) : null,
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'links': links?.toJson(),
      'meta': meta?.toJson(),
      'error': error,
      'message': message,
    };
  }
}

class BrandResponse {
  bool? error;
  Brand? data;
  String? message;

  BrandResponse({
    this.error,
    this.data,
    this.message,
  });

  factory BrandResponse.fromJson(Map<String, dynamic> json) {
    return BrandResponse(
      error: json['error'] as bool?,
      data: json['data'] != null ? Brand.fromJson(json['data']) : null,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data?.toJson(),
      'message': message,
    };
  }
}

class ProductListResponse {
  List<Product>? data;
  PaginationLinks? links;
  PaginationMeta? meta;
  bool? error;
  String? message;

  ProductListResponse({
    this.data,
    this.links,
    this.meta,
    this.error,
    this.message,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e))
          .toList(),
      links: json['links'] != null
          ? PaginationLinks.fromJson(json['links'])
          : null,
      meta: json['meta'] != null ? PaginationMeta.fromJson(json['meta']) : null,
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'links': links?.toJson(),
      'meta': meta?.toJson(),
      'error': error,
      'message': message,
    };
  }
}

class CreateCartRequest {
  var productIds = <int>[];
  var quantities = <int>[];

  CreateCartRequest({
    this.productIds = const [],
    this.quantities = const [],
  });

  factory CreateCartRequest.fromJson(Map<String, dynamic> json) {
    return CreateCartRequest(
      productIds: json['product_ids'] as List<int>,
      quantities: json['qty'] as List<int>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_ids': productIds,
      'qty': quantities,
    };
  }
}

class CartRequest {
  int? productId;
  int? quantity;

  CartRequest({
    this.productId,
    this.quantity,
  });

  factory CartRequest.fromJson(Map<String, dynamic> json) {
    return CartRequest(
      productId: json['product_id'] as int?,
      quantity: json['qty'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'qty': quantity,
    };
  }
}

class CartRefreshRequest {
  List<CartItem>? products;

  CartRefreshRequest({
    this.products,
  });

  factory CartRefreshRequest.fromJson(Map<String, dynamic> json) {
    return CartRefreshRequest(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((e) => e.toJson()).toList(),
    };
  }
}

class OrderListResponse {
  List<Order>? data;
  PaginationLinks? links;
  PaginationMeta? meta;
  bool? error;
  String? message;

  OrderListResponse({
    this.data,
    this.links,
    this.meta,
    this.error,
    this.message,
  });

  factory OrderListResponse.fromJson(Map<String, dynamic> json) {
    return OrderListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e))
          .toList(),
      links: json['links'] != null
          ? PaginationLinks.fromJson(json['links'])
          : null,
      meta: json['meta'] != null ? PaginationMeta.fromJson(json['meta']) : null,
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'links': links?.toJson(),
      'meta': meta?.toJson(),
      'error': error,
      'message': message,
    };
  }
}

class ProductCategoryListResponse {
  List<ProductCategory>? data;
  bool? error;
  String? message;

  ProductCategoryListResponse({
    this.data,
    this.error,
    this.message,
  });

  factory ProductCategoryListResponse.fromJson(Map<String, dynamic> json) {
    return ProductCategoryListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductCategory.fromJson(e))
          .toList(),
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'error': error,
      'message': message,
    };
  }
}

class ProductCategoryResponse {
  bool? error;
  ProductCategory? data;
  String? message;

  ProductCategoryResponse({
    this.error,
    this.data,
    this.message,
  });

  factory ProductCategoryResponse.fromJson(Map<String, dynamic> json) {
    return ProductCategoryResponse(
      error: json['error'] as bool?,
      data:
          json['data'] != null ? ProductCategory.fromJson(json['data']) : null,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data?.toJson(),
      'message': message,
    };
  }
}

class ProductResponse {
  bool? error;
  Product? data;
  String? message;

  ProductResponse({
    this.error,
    this.data,
    this.message,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      error: json['error'] as bool?,
      data: json['data'] != null ? Product.fromJson(json['data']) : null,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data?.toJson(),
      'message': message,
    };
  }
}

class ReviewListResponse {
  List<Review>? data;
  PaginationLinks? links;
  PaginationMeta? meta;
  bool? error;
  String? message;

  ReviewListResponse({
    this.data,
    this.links,
    this.meta,
    this.error,
    this.message,
  });

  factory ReviewListResponse.fromJson(Map<String, dynamic> json) {
    return ReviewListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e))
          .toList(),
      links: json['links'] != null
          ? PaginationLinks.fromJson(json['links'])
          : null,
      meta: json['meta'] != null ? PaginationMeta.fromJson(json['meta']) : null,
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'links': links?.toJson(),
      'meta': meta?.toJson(),
      'error': error,
      'message': message,
    };
  }
}

class Review {
  // Define review fields here

  Review();

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        // Parse fields from json
        );
  }

  Map<String, dynamic> toJson() {
    return {
      // Map fields to json
    };
  }
}

class UserProfileResponse {
  bool? error;
  UserProfile? data;
  String? message;

  UserProfileResponse({
    this.error,
    this.data,
    this.message,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      error: json['error'] as bool?,
      data: json['data'] != null ? UserProfile.fromJson(json['data']) : null,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'data': data?.toJson(),
      'message': message,
    };
  }
}

class UpdateProfileRequest {
  String? firstName;
  String? lastName;
  String? name;
  String? phone;
  String? dob;
  String? gender;
  String? description;
  String? email;

  UpdateProfileRequest({
    this.firstName,
    this.lastName,
    this.name,
    this.phone,
    this.dob,
    this.gender,
    this.description,
    this.email,
  });

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    return UpdateProfileRequest(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      description: json['description'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'name': name,
      'phone': phone,
      'dob': dob,
      'gender': gender,
      'description': description,
      'email': email,
    };
  }
}

class UpdatePasswordRequest {
  String? password;

  UpdatePasswordRequest({
    this.password,
  });

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordRequest(
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'password': password,
    };
  }
}

class PaginationLinks {
  String? first;
  String? last;
  String? prev;
  String? next;

  PaginationLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory PaginationLinks.fromJson(Map<String, dynamic> json) {
    return PaginationLinks(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first': first,
      'last': last,
      'prev': prev,
      'next': next,
    };
  }
}

class PaginationMeta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<PaginationLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  PaginationMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      currentPage: json['current_page'] as int?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => PaginationLink.fromJson(e))
          .toList(),
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      to: json['to'] as int?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'from': from,
      'last_page': lastPage,
      'links': links?.map((e) => e.toJson()).toList(),
      'path': path,
      'per_page': perPage,
      'to': to,
      'total': total,
    };
  }
}

class PaginationLink {
  String? url;
  String? label;
  bool? active;

  PaginationLink({
    this.url,
    this.label,
    this.active,
  });

  factory PaginationLink.fromJson(Map<String, dynamic> json) {
    return PaginationLink(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'label': label,
      'active': active,
    };
  }
}

class CartResponse {
  final String id;
  final int count;
  final String totalPrice;
  final Map<String, CartProductEntity> content;

  CartResponse({
    required this.id,
    required this.count,
    required this.totalPrice,
    required this.content,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      id: json['id'],
      count: json['count'],
      totalPrice: json['total_price'],
      content: (json['content'] as Map).map(
          (key, value) => MapEntry(key, CartProductEntity.fromJson(value))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'count': count,
      'total_price': totalPrice,
      'content': content.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}

class CartProductEntity {
  final String rowId;
  final int id;
  final String name;
  final int qty;
  final double price;
  final CartProductOptionsEntity options;
  final double tax;
  final double subtotal;
  final String updatedAt;

  CartProductEntity({
    required this.rowId,
    required this.id,
    required this.name,
    required this.qty,
    required this.price,
    required this.options,
    required this.tax,
    required this.subtotal,
    required this.updatedAt,
  });

  factory CartProductEntity.fromJson(Map<String, dynamic> json) {
    return CartProductEntity(
      rowId: json['rowId'],
      id: json['id'],
      name: json['name'],
      qty: json['qty'],
      price: json['price'],
      options: CartProductOptionsEntity.fromJson(json['options']),
      tax: json['tax'],
      subtotal: json['subtotal'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rowId': rowId,
      'id': id,
      'name': name,
      'qty': qty,
      'price': price,
      'options': options.toJson(),
      'tax': tax,
      'subtotal': subtotal,
      'updated_at': updatedAt,
    };
  }
}

class CartProductOptionsEntity {
  final String image;
  final String attributes;
  final int taxRate;
  final Map<String, int> taxClassesMap;
  final List<dynamic> options;
  final List<dynamic> extras;
  final String sku;
  final int weight;

  CartProductOptionsEntity({
    required this.image,
    required this.attributes,
    required this.taxRate,
    required this.taxClassesMap,
    required this.options,
    required this.extras,
    required this.sku,
    required this.weight,
  });

  factory CartProductOptionsEntity.fromJson(Map<String, dynamic> json) {
    return CartProductOptionsEntity(
      image: json['image'],
      attributes: json['attributes'] ?? '',
      taxRate: json['taxRate'],
      taxClassesMap: Map<String, int>.from(json['taxClasses']),
      options: json['options'] ?? [],
      extras: json['extras'] ?? [],
      sku: json['sku'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'attributes': attributes,
      'taxRate': taxRate,
      'taxClasses': taxClassesMap,
      'options': options,
      'extras': extras,
      'sku': sku,
      'weight': weight,
    };
  }
}
