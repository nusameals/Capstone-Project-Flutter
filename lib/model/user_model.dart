class LoginResponsModel {
  final String token;
  final String error;

  LoginResponsModel({required this.token, required this.error});

  factory LoginResponsModel.formJson(Map<String, dynamic> json) {
    return LoginResponsModel(
        // ignore: prefer_if_null_operators
        token: json["token"] != null ? json["token"] : "",
        // ignore: prefer_if_null_operators
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
      'password': password.toString(),
    };

    return map;
  }
}

class RegisterResponsModel {
  final String token;
  final String error;

  RegisterResponsModel({required this.token, required this.error});

  factory RegisterResponsModel.formJson(Map<String, dynamic> json) {
    return RegisterResponsModel(
        // ignore: prefer_if_null_operators
        token: json["token"] != null ? json["token"] : "",
        // ignore: prefer_if_null_operators
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
