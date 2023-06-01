// ignore_for_file: prefer_if_null_operators

class RegisterResponsModel {
  final String token;
  final String error;

  RegisterResponsModel({required this.token, required this.error});

  factory RegisterResponsModel.formJson(Map<String, dynamic> json) {
    return RegisterResponsModel(
        token: json["token"] != null ? json["token"] : "",
        error: json["error"] != null ? json["error"] : "");
  }
}

class RegisterRequestModel {
  String username;
  String email;
  String password;
  String confirmPassword;

  RegisterRequestModel(
      {required this.username,
      required this.email,
      required this.password,
      required this.confirmPassword});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.toString(),
      'email': email.toString(),
      'password': password.toString(),
      'confirmpassword': confirmPassword.toString(),
    };

    return map;
  }
}
