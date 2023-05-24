import 'package:flutter/material.dart';
import 'package:nusameals/view/auth/forgot_password_screen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool validForm = false;
  bool _passwordSecureText = true;
  bool _confirmPasswordSecureText = true;

  showHidePassword() {
    setState(() {
      _passwordSecureText = !_passwordSecureText;
    });
  }

  showHideConfirmPassword() {
    setState(() {
      _confirmPasswordSecureText = !_confirmPasswordSecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    void showSnackbar(BuildContext context) {
      final snackBar = SnackBar(
        content: Row(
          children: const [
            Text(
              'Password has been changed. Please login now!',
              style: TextStyle(color: Color(0XFFCDE1F2), fontSize: 14),
            ),
            SizedBox(width: 39),
            Text(
              'Login',
              style: TextStyle(fontSize: 14, color: Color(0xff000000)),
            )
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 360,
          width: 528,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const SizedBox(width: 20),
                  const Text(
                    'Changed Password',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
              const SizedBox(height: 41),
              TextFormField(
                controller: _passwordController,
                obscureText: _passwordSecureText,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  suffixIcon: IconButton(
                    onPressed: showHidePassword,
                    icon: _passwordSecureText
                        ? const Icon(
                            Icons.visibility_outlined,
                            size: 20,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            size: 20,
                            color: Colors.black,
                          ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    validForm = _passwordController.text.isNotEmpty;
                  });
                },
                // validator: (value) {
                //   if (value != null && value.length < 5) {
                //     return 'Enter min. 5 characters';
                //   } else {
                //     return null; //form is valid
                //   }
                // },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _confirmpasswordController,
                obscureText: _confirmPasswordSecureText,
                decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                  suffixIcon: IconButton(
                    onPressed: showHideConfirmPassword,
                    icon: _confirmPasswordSecureText
                        ? const Icon(
                            Icons.visibility_outlined,
                            size: 20,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            size: 20,
                            color: Colors.black,
                          ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    validForm = _confirmpasswordController.text.isNotEmpty;
                  });
                },
                // validator: (value) {
                //   if (value != null && value.length < 5) {
                //     return 'Enter min. 5 characters';
                //   } else {
                //     return null; //form is valid
                //   }
                // },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: validForm
                        ? const Color(0xff0669BD)
                        : const Color(0xffEFEFEF),
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
      ),
    );
  }
}
