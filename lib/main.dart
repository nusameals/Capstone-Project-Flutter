import 'package:flutter/material.dart';
import 'package:nusameals/view/account/profil_screen.dart';
import 'package:nusameals/view/account/update_profil_screen.dart';
import 'package:nusameals/view/auth/change_password_screen.dart';
import 'package:nusameals/view/auth/forgot_password_screen.dart';
import 'package:nusameals/view/auth/login_screen.dart';
import 'package:nusameals/view/auth/register_screen.dart';
import 'package:nusameals/view/splash_screen.dart';
import 'package:provider/provider.dart';
import 'view_model/user_view_model.dart';

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
        title: 'Nusameals',
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/forgot': (context) => const ForgotPasswordScreen(),
          '/change': (context) => const ChangePassword(),
          '/profile': (context) => const ProfilScreen(),
          '/updateProfile': (context) => const UpdateProfilScreen(),
        },
      ),
    );
  }
}
