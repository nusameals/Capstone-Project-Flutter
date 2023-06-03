import 'dart:convert';
import 'package:http/http.dart' as http;
import '../user_model.dart';

class RegisterApi {
  Future<RegisterResponsModel> login(RegisterRequestModel requestModels) async {
    String url = "13.229.218.76:8080/register";

    // ignore: unused_local_variable
    final respons = await http.post(url as Uri, body: requestModels.toJson());
    if (respons.statusCode == 200 || respons.statusCode == 400) {
      return RegisterResponsModel.formJson(json.decode(respons.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
