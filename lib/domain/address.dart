class Address {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? country;
  String? state;
  String? city;
  String? address;
  String? zipCode;
  bool? isDefault;

  Address({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.country,
    this.state,
    this.city,
    this.address,
    this.zipCode,
    this.isDefault,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      zipCode: json['zip_code'] as String?,
      isDefault: json['is_default'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'country': country,
      'state': state,
      'city': city,
      'address': address,
      'zip_code': zipCode,
      'is_default': isDefault,
    };
  }
}
