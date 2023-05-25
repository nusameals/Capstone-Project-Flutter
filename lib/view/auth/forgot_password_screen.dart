import 'package:flutter/material.dart';
import 'package:nusameals/view/auth/login_screen.dart';
import 'change_password_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool validForm = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 241,
          width: 428,
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
                  const SizedBox(width: 10),
                  Text(
                    'Forgot Password',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 45),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: GoogleFonts.poppins(fontSize: 14)),
                onChanged: (value) {
                  setState(() {
                    validForm = _emailController.text.isNotEmpty;
                  });
                },
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
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context) => const ChangePassword(),
                    );
                  },
                  child: Text('Submit',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: validForm
                            ? const Color(0xffFFFFFF)
                            : const Color(0xff484848),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
