// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:convert';

class UserModel {
  // ignore: non_constant_identifier_names
  final String email_or_username;
  final String username;
  final String email;
  final String password;
  // ignore: non_constant_identifier_names
  final String retype_Password;
  // final String? phone_number;
  // final String? profilePicturePath;

  UserModel({
    // ignore: non_constant_identifier_names
    required this.email_or_username,
    required this.username,
    required this.email,
    required this.password,
    // ignore: non_constant_identifier_names
    required this.retype_Password,
    // this.phone_number,
    // this.profilePicturePath,
  });

  static UserModel fromJson({required json}) {
    // ignore: unused_local_variable
    final data = jsonDecode(json);
    return UserModel(
      email_or_username: json['email_or_username'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      retype_Password: json['retype_password'],
      // phone_number: json['phoneNumber'],
      // profilePicturePath: json['profilePicturePath'],
    );
  }
}

class ProfilDataModel {
  int id;
  String name;
  String username;
  String email;
  String gender;
  String phone_number;
  String picture;

  ProfilDataModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.gender,
    required this.phone_number,
    required this.picture,
  });

  factory ProfilDataModel.fromJson(Map<String, dynamic> json) =>
      ProfilDataModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        gender: json["gender"],
        phone_number: json["phone_number"],
        picture: json["picture"] ?? "",
      );
}
