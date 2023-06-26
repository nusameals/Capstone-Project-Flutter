import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nusameals/view/auth/register_screen.dart';

void main() {
  testWidgets('Register Screen', (WidgetTester tester) async {
    // Build the RegisterScreen widget
    await tester.pumpWidget(RegisterScreen());

    // Find form fields
    final usernameField = find.byType(TextFormField).at(0);
    final emailField = find.byType(TextFormField).at(1);
    final passwordField = find.byType(TextFormField).at(2);
    final confirmPasswordField = find.byType(TextFormField).at(3);

    // Enter text into the form fields
    await tester.enterText(usernameField, 'JohnDoe');
    await tester.enterText(emailField, 'johndoe@example.com');
    await tester.enterText(passwordField, 'password');
    await tester.enterText(confirmPasswordField, 'password');

    // Submit the form
    final createAccountButton = find.text('Create Account');
    await tester.tap(createAccountButton);
    await tester.pumpAndSettle();

    // Verify the result
    expect(find.text('Successefully create your account, please wait...'), findsOneWidget);
  });
}
