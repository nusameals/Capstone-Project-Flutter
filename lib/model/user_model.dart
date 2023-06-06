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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email_or_username: json['email_or_username'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      retype_Password: json['retype_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usernamelog': email_or_username,
      'username': username,
      'email': email,
      'password': password,
      'retype_password': retype_Password,
    };
  }
}
