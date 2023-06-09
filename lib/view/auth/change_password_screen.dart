// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  const SizedBox(width: 10),
                  Text('Changed Password',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black))
                ],
              ),
              const SizedBox(height: 41),
              TextFormField(
                controller: _passwordController,
                obscureText: _passwordSecureText,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
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
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
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
                  onPressed: () {
                    void showSnackbar(BuildContext context,
                        {String actionText = 'Login',
                        VoidCallback? onPressed}) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: const Color(0xffCDE1F2),
                          behavior: SnackBarBehavior.floating,
                          content: const Text(
                            'Password has been changed. Please login now!',
                          ),
                          action: SnackBarAction(
                            label: actionText,
                            textColor: Colors.black,
                            onPressed: onPressed ?? () {},
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
