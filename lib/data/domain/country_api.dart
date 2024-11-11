import 'package:ecommerce_app/domain/country.dart';

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
