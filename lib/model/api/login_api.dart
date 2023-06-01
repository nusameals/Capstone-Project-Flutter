import 'dart:convert';
import 'package:nusameals/model/login_model.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  Future<LoginResponsModel> login(LoginRequestModel requestModel) async {
    String url = "localhost:8080/login";

    // ignore: unused_local_variable
    final respons = await http.post(url as Uri, body: requestModel.toJson());
    if (respons.statusCode == 200 || respons.statusCode == 400) {
      return LoginResponsModel.formJson(json.decode(respons.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
