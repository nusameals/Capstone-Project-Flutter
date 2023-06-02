// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  void login(String email, String password) async {
    try {
      Response response = await post(Uri.parse("13.229.218.76:8080"), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        print('successfull');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void register(String username, String email, String password,
      String confirmPassword) async {
    try {
      Response response = await post(Uri.parse("13.229.218.76:8080"), body: {
        'username': username,
        'email': email,
        'password': password,
        'confirmpassword': confirmPassword,
      });

      if (response.statusCode == 200) {
        print('successfull');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
