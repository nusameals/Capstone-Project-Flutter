// ignore: unused_import
// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/api/api_constants.dart';
import '../model/api/user_api.dart';
import '../model/user_model.dart';

class UserViewModel with ChangeNotifier {
  final UserAPI _userAPI = UserAPI();

  var http;

  Future loginUser({
    // ignore: non_constant_identifier_names
    required String email_or_username,
    required String password,
  }) async {
    await _userAPI.loginUser(
        email_or_username: email_or_username, password: password);
    notifyListeners();
  }

  Future registerUser({
    required String username,
    required String email,
    required String password,
    // ignore: non_constant_identifier_names
    required String retype_password,
  }) async {
    await _userAPI.registerUser(
      username: username,
      email: email,
      password: password,
      retype_password: retype_password,
    );
    notifyListeners();
  }

  ProfilDataModel? userData;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchUser() async {
    isLoading = true;
    notifyListeners();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var idUser = prefs.getString('id');
      final response =
          await http.get(Uri.parse('${ApiConstants.baseUrl}/users/$idUser'));

      if (response.statusCode == 200) {
        userData = ProfilDataModel.fromJson(jsonDecode(response.body));
        errorMessage = '';
      } else {
        errorMessage = 'User not found with ID: $idUser';
      }
    } catch (error) {
      errorMessage = 'Failed to fetch user: $error';
    }

    isLoading = false;
    notifyListeners();
  }
}
