import 'package:flutter/material.dart';
import 'package:nusameals/view/auth/login_screen.dart';
import 'package:nusameals/view/splash_screen.dart';
import 'package:provider/provider.dart';

import 'view_model/user_view_model.dart';

import 'view/account/profil_screen.dart';
import 'view/splash_screen.dart';



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
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nusa Meals',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'poppins',
        ),
<<<<<<< HEAD
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
        },
=======
        home: const ProfilScreen(),
>>>>>>> account
      ),
    );
  }
}
