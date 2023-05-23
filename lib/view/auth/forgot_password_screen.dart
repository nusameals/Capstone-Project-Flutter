import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:nusameals/view/auth/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool validForm = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 241,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back)),
                const SizedBox(width: 20),
                const Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )
              ],
            ),
            const SizedBox(height: 45),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  validForm = _emailController.text.isNotEmpty;
                });
              },
              validator: (email) {
                // 5 install package email_validator
                if (email != null && !EmailValidator.validate(email)) {
                  return 'Enter a valid email';
                } else {
                  return null; //form is valid
                }
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      validForm ? Color(0xff0669BD) : Color(0xffEFEFEF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 14,
                    color: validForm
                        ? const Color(0xffFFFFFF)
                        : const Color(0xff484848),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
