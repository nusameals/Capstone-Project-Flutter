import 'dart:convert';

class UserModel {
  // ignore: non_constant_identifier_names
  final String email_or_username;
  final String username;
  final String email;
  final String password;
  // ignore: non_constant_identifier_names
  final String retype_Password;

  UserModel({
    // ignore: non_constant_identifier_names
    required this.email_or_username,
    required this.username,
    required this.email,
    required this.password,
    // ignore: non_constant_identifier_names
    required this.retype_Password,
  });

  static UserModel fromJson({required json}) {
    // ignore: unused_local_variable
    final data = jsonDecode(json);
    return UserModel(
        email_or_username: json['email_or_username'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        retype_Password: json['retype_password']);
  }
}
