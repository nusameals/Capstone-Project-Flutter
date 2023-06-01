// ignore_for_file: prefer_if_null_operators

class LoginResponsModel {
  final String token;
  final String error;

  LoginResponsModel({required this.token, required this.error});

  factory LoginResponsModel.formJson(Map<String, dynamic> json) {
    return LoginResponsModel(
        token: json["token"] != null ? json["token"] : "",
        error: json["error"] != null ? json["error"] : "");
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.toString(),
      'password': email.toString(),
    };

    return map;
  }
}
