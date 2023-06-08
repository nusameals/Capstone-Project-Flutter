import 'package:flutter/material.dart';

import 'view/my_order/my_order_screen.dart';

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
      title: 'Nusameals',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyOrderScreen(),
    );
  }
}
