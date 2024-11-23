class UserProfile {
  var id = 0;
  var email = '';
  var name = '';
  var phone = '';
  var avatar = '';
  var dob = '';
  var gender = '';
  var description = '';

  UserProfile({
    this.id = 0,
    this.email = '',
    this.name = '',
    this.phone = '',
    this.avatar = '',
    this.dob = '',
    this.gender = '',
    this.description = '',
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'avatar': avatar,
      'dob': dob,
      'gender': gender,
      'description': description,
    };
  }
}
