import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/domain/api_responses.dart';
import 'package:ecommerce_app/domain/address.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  // Address APIs
  @GET("/api/v1/ecommerce/addresses")
  Future<List<Address>> getAddresses();

  @POST("/api/v1/ecommerce/addresses")
  Future<AddressResponse> createAddress(@Body() AddressRequest address);

  @PUT("/api/v1/ecommerce/addresses/{id}")
  Future<AddressResponse> updateAddress(
      @Path("id") int id, @Body() AddressRequest address);

  @DELETE("/api/v1/ecommerce/addresses/{id}")
  Future<BaseResponse> deleteAddress(@Path("id") int id);

  @GET("/api/v1/ecommerce/countries")
  Future<CountryResponse> getCountries();

  // Authentication APIs
  @POST("/api/v1/register")
  Future<BaseResponse> register(@Body() RegisterRequest request);

  @POST("/api/v1/login")
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST("/api/v1/email/check")
  Future<EmailCheckResponse> checkEmail(@Body() EmailCheckRequest request);

  @POST("/api/v1/password/forgot")
  Future<BaseResponse> forgotPassword(@Body() ForgotPasswordRequest request);

  @POST("/api/v1/resend-verify-account-email")
  Future<BaseResponse> resendVerificationEmail(
      @Body() ResendVerificationRequest request);

  @GET("/api/v1/logout")
  Future<BaseResponse> logout();

  // Blog APIs
  @GET("/api/v1/search")
  Future<SearchResponse> searchPosts(@Query("q") String query);

  @GET("/api/v1/posts")
  Future<PostListResponse> getPosts();

  @GET("/api/v1/categories")
  Future<CategoryListResponse> getCategories();

  @GET("/api/v1/tags")
  Future<TagListResponse> getTags();

  @GET("/api/v1/posts/filters")
  Future<PostListResponse> filterPosts(@Queries() Map<String, dynamic> queries);

  @GET("/api/v1/posts/{slug}")
  Future<PostResponse> getPostBySlug(@Path("slug") String slug);

  @GET("/api/v1/categories/filters")
  Future<CategoryListResponse> filterCategories(
      @Queries() Map<String, dynamic> queries);

  @GET("/api/v1/categories/{slug}")
  Future<ProductCategoryResponse> getCategoryBySlug(@Path("slug") String slug);

  // Brands APIs
  @GET("/api/v1/ecommerce/brands")
  Future<BrandListResponse> getBrands(@Queries() Map<String, dynamic> queries);

  @GET("/api/v1/ecommerce/brands/{slug}")
  Future<BrandResponse> getBrandBySlug(@Path("slug") String slug);

  @GET("/api/v1/ecommerce/brands/{id}/products")
  Future<ProductListResponse> getProductsByBrand(@Path("id") int id);

  // Cart APIs
  @POST("/api/v1/ecommerce/cart")
  Future<CartResponse> addToCart(@Body() CartRequest request);

  @PUT("/api/v1/ecommerce/cart/{id}")
  Future<CartResponse> updateProduct(
      @Path("id") String id, @Body() CartRequest request);

  @POST("/api/v1/ecommerce/cart/refresh")
  Future<BaseResponse> refreshCart(@Body() CartRefreshRequest request);

  @GET("/api/v1/ecommerce/cart/{id}")
  Future<CartResponse> getCard(@Path('id') String id);

  // Cart APIs
  @DELETE("/api/v1/ecommerce/cart/{id}")
  Future<CartResponse> removeProductFromCart(
      @Path('id') String id, @Body() CartRequest request);

  // Orders APIs
  @GET("/api/v1/ecommerce/orders")
  Future<OrderListResponse> getOrders();

  // Product Categories APIs
  @GET("/api/v1/ecommerce/product-categories")
  Future<ProductCategoryListResponse> getProductCategories(
      @Queries() Map<String, dynamic> queries);

  @GET("/api/v1/ecommerce/product-categories/{slug}")
  Future<ProductCategoryResponse> getProductCategoryBySlug(
      @Path("slug") String slug);

  @GET("/api/v1/ecommerce/product-categories/{id}/products")
  Future<ProductListResponse> getProductsByCategory(@Path("id") int id);

  // Products APIs
  @GET("/api/v1/ecommerce/products")
  Future<ProductListResponse> getProducts(
      @Queries() Map<String, dynamic> queries);

  @GET("/api/v1/ecommerce/products/{slug}")
  Future<ProductResponse> getProductBySlug(@Path("slug") String slug);

  @GET("/api/v1/ecommerce/products/{slug}/related")
  Future<ProductListResponse> getRelatedProducts(@Path("slug") String slug);

  @GET("/api/v1/ecommerce/products/{slug}/reviews")
  Future<ReviewListResponse> getProductReviews(@Path("slug") String slug);

  // Profile APIs
  @GET("/api/v1/me")
  Future<UserProfileResponse> getProfile();

  @PUT("/api/v1/me")
  Future<UserProfileResponse> updateProfile(
      @Body() UpdateProfileRequest request);

  @POST("/api/v1/update/avatar")
  @MultiPart()
  Future<BaseResponse> updateAvatar(@Part() File avatar);

  @PUT("/api/v1/update/password")
  Future<BaseResponse> updatePassword(@Body() UpdatePasswordRequest request);
}
