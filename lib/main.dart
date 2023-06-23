import 'package:flutter/material.dart';
import 'package:nusameals/view/account/profil_screen.dart';
import 'package:nusameals/view/auth/change_password_screen.dart';
import 'package:nusameals/view/auth/forgot_password_screen.dart';
import 'package:nusameals/view/auth/login_screen.dart';
import 'package:nusameals/view/auth/register_screen.dart';
import 'package:nusameals/view/splash_screen.dart';
import 'view_model/update_profile_view_model.dart';
import 'view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'view/cart/cart_screen.dart';
import 'view/menu/search_screen.dart';
import 'view/scan/scan_screen.dart';
import 'view_model/cart_view_model.dart';
import 'view_model/menu_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpdateProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MenuViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nusameals',
        theme: ThemeData(useMaterial3: true),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/forgot': (context) => const ForgotPasswordScreen(),
          '/change': (context) => const ChangePassword(),
          '/profile': (context) => const ProfilScreen(),
          '/search': (context) => const SearchScreen(),
          '/scan': (context) => const ScanScreen(),
          '/cart': (context) => const CartScreen(),
        },
      ),
    );
  }
}
