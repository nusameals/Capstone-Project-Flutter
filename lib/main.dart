import 'package:flutter/material.dart';
import 'package:nusameals/view/main_screen.dart';
import 'package:provider/provider.dart';
import 'view/menu/search_screen.dart';
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
          create: (context) => MenuViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const MainScreen(),
          '/search': (context) => const SearchScreen(),
        },
      ),
    );
  }
}
