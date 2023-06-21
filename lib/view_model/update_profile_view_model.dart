import 'package:flutter/material.dart';

class UpdateProfileViewModel with ChangeNotifier {
  String username = '';
  String email = '';
  String phone = '';
  String profilePhoto = '';

  void updateProfile(
      {String? newUsername,
      String? newEmail,
      String? newphone,
      String? newprofilePhoto}) {
    if (newUsername != null) {
      username = newUsername;
    }
    if (newEmail != null) {
      email = newEmail;
    }
    if (newphone != null) {
      phone = newphone;
    }
    if (newprofilePhoto != null) {
      profilePhoto = newprofilePhoto;
    }
    notifyListeners();
  }
}
