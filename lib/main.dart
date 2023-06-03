import 'package:flutter/material.dart';
import 'package:nusameals/view/auth/login_screen.dart';
import 'package:provider/provider.dart';
import 'view_model/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nusa Meals',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'poppins',
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
