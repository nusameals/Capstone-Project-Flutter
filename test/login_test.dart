import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nusameals/view/auth/login_screen.dart';
import 'package:nusameals/view_model/user_view_model.dart';
import 'package:provider/provider.dart';


void main() {
  testWidgets('Login Screen Test', (WidgetTester tester) async {
    // Bangun widget LoginScreen
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserViewModel()),
        ],
        child: MaterialApp(
          home: LoginScreen(),
        ),
      ),
    );

    // Cek teks "Login" pada widget
    expect(find.text('Login'), findsOneWidget);

    // Cek teks "Username" pada widget
    expect(find.text('Username'), findsOneWidget);

    // Cek teks "Password" pada widget
    expect(find.text('Password'), findsOneWidget);

    // Cek teks "Forgot Password" pada widget
    expect(find.text('Forgot Password'), findsOneWidget);

    // Cek teks "Don't have an account ?" pada widget
    expect(find.text("Don't have an account ?"), findsOneWidget);

    // Cek teks "Create Account" pada widget
    expect(find.text('Create Account'), findsOneWidget);
  });
}
