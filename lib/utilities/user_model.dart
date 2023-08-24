import 'dart:convert';

class UserModel {
  final String email;
  final String name;
  final int mobile;
  final String password;
  final String cpassword;
  UserModel({
    required this.email,
    required this.name,
    required this.mobile,
    required this.password,
    required this.cpassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'mobile':  mobile,
      'password': password,
      'cpassword': cpassword,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      mobile: map['mobile'] ?? 1234567890,
      password: map['password'] ?? '',
      cpassword: map['cpassword'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  UserModel copyWith({
    String? email,
    String? name,
    int? mobile,
    String? password,
    String? cpassword,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      cpassword: cpassword ?? this.cpassword,
    );
  }
}
