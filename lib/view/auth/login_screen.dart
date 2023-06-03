// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusameals/view/auth/register_screen.dart';
import 'package:nusameals/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../../model/user_model.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _secureText = true;
  bool validForm = false;
  late LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel(email: "", password: "");
  }

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    final _authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: const Color(0xff0669BD),
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(children: [
                    Image.asset('assets/images/nusameals.png', height: 100),
                    const SizedBox(height: 41),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 31),
                                    Text(
                                      'Login',
                                      style: GoogleFonts.poppins(
                                        fontSize: 32,
                                        color: const Color(0xff0669BD),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 31),
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: GoogleFonts.poppins(
                                              fontSize: 16)),
                                      onSaved: (input) =>
                                          requestModel.email = input!,
                                      validator: (email) {
                                        if (email!.isEmpty) {
                                          return "please enter email";
                                        }
                                        if (!RegExp(
                                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                            .hasMatch(email)) {
                                          return "please enter valid email";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: _passwordController,
                                      obscureText: _secureText,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle:
                                            GoogleFonts.poppins(fontSize: 16),
                                        suffixIcon: IconButton(
                                          onPressed: showHide,
                                          icon: _secureText
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
                                      onSaved: (input) =>
                                          requestModel.password = input!,
                                      // ignore: body_might_complete_normally_nullable
                                      validator: (password) {
                                        if (password == null ||
                                            password.isEmpty) {
                                          return 'Masukaan Password';
                                        } else if (password.length < 6) {
                                          return 'Enter min 5 characters';
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 30),
                                    bottomSheet(),
                                    const SizedBox(height: 30),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        height: 40,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff0669BD),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (validateAndSave()) {
                                              // ignore: prefer_const_declarations, unused_local_variable
                                              final text =
                                                  'Successefully, please wait...';
                                              // ignore: unuseds_local_variable
                                              final snackBar = SnackBar(
                                                content: Text(
                                                  text,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                ),
                                                backgroundColor:
                                                    const Color(0xffCDE1F2),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);

                                              print(requestModel.toJson());

                                              Provider.of<AuthProvider>(context,
                                                      listen: false)
                                                  .toLoginJson();
                                            }
                                            _emailController.clear();
                                            _passwordController.clear();
                                          },
                                          child: Text(
                                            'Login',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    createAccount()
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        TextButton(
          onPressed: () {
            // tampilkan modal forgot password
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) => const ForgotPasswordScreen(),
            );
          },
          child: Text(
            'Forgot Password',
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ),
      ],
    );
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget createAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account ?",
            style: GoogleFonts.poppins(fontSize: 14)),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ));
          },
          child: Text(
            'Create Account',
            style: GoogleFonts.poppins(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
