import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'api_constants.dart';

class UserAPI {
  Future loginUser({
    // ignore: non_constant_identifier_names
    required String email_or_username,
    required String password,
  }) async {
    try {
      final url = Uri.parse('${ApiConstants.baseUrl}/login');

      final response = await http.post(url, body: {
        'email_or_username': email_or_username,
        'password': password,
      });

      if (response.statusCode == 200) {
        final responData = jsonDecode(response.body);
        String id = responData['id'].toString();
        String username = responData['username'];
        String token = responData['token'];
        debugPrint(id);
        debugPrint(username);
        debugPrint(token);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('id', responData['id'].toString());
        await prefs.setString('username', responData['username']);
        await prefs.setString('token', responData['token']);
        return responData;
      } else {
        throw Exception('user or email not found');
      }
    } catch (error) {
      // ignore: avoid_print
      throw Exception('Error: $error');
    }
  }

  // ignore: non_constant_identifier_names
  Future registerUser({
    required String username,
    required String email,
    required String password,
    // ignore: non_constant_identifier_names
    required String retype_password,
  }) async {
    // ignore: unused_local_variable
    try {
      final url = Uri.parse('${ApiConstants.baseUrl}/register');

      final response = await http.post(url, body: {
        'username': username,
        'email': email,
        'password': password,
        'retype_password': retype_password,
      });

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        String message = response.body;
        // ignore: avoid_print
        print(message);
        await prefs.setString('message', message);
        return message;
      } else {
        throw Exception('Username is already Exists');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
