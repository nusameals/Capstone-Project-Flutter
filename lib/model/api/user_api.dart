import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI {
  final String baseUrl = 'http://testing.hopto.org';

  // ignore: non_constant_identifier_names
  Future loginUser({
    // ignore: non_constant_identifier_names
    required String email_or_username,
    required String password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final url = Uri.parse('$baseUrl/login');

      final response = await http.post(url, body: {
        'email_or_username': email_or_username,
        'password': password,
      });

      if (response.statusCode == 200) {
        String token = response.body;
        // ignore: avoid_print
        print(token);
        await prefs.setString('token', token);
        return token;
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final url = Uri.parse('$baseUrl/register');

      final response = await http.post(url, body: {
        'username': username,
        'email': email,
        'password': password,
        'retype_password': retype_password,
      });

      if (response.statusCode == 200) {
        String message = response.body;
        // ignore: avoid_print
        print(message);
        await prefs.setString('message', message);
        return message;
      } else {
        throw Exception('username is already Exists');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
