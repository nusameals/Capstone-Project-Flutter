import 'package:flutter/material.dart';
import '../model/api/user_api.dart';

class UserViewModel with ChangeNotifier {
  final UserAPI _userAPI = UserAPI();

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
}
