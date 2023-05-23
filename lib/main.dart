import 'package:flutter/material.dart';
import 'package:nusameals/view/auth/login_screen.dart';
import 'view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nusa Meals',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
      },
    );
  }
}
