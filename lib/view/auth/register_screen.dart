// ignore_for_file: non_constant_identifier_names, avoid_print
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/user_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool _passwordSecureText = true;
  bool _confirmPasswordSecureText = true;
  bool isRetypePasswordValid = true;

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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
    final _userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: const Color(0xff0669BD),
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(children: [
                    Image.asset('assets/images/nusameals.png', height: 100),
                    const SizedBox(height: 30),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(35, 25, 35, 25),
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
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      'Create Account',
                                      style: GoogleFonts.poppins(
                                        fontSize: 32,
                                        color: const Color(0xff0669BD),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: _usernameController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: 'Username',
                                        labelStyle: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // ignore: body_might_complete_normally_nullable
                                      validator: (username) {
                                        if (username!.isEmpty) {
                                          return 'username cannot be empty';
                                        } else if (RegExp(r'^[a-z][A-Za-z]*$')
                                            .hasMatch(username)) {
                                          return 'username must start with capital letter';
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      validator: (email) {
                                        if (email!.isEmpty) {
                                          return "email cannot be empty";
                                        } else if (!RegExp(
                                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                            .hasMatch(email)) {
                                          return "please enter valid email";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: _passwordController,
                                      obscureText: _passwordSecureText,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
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
                                      validator: (password) {
                                        if (password!.isEmpty) {
                                          return 'Please a Enter Password';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: _confirmpasswordController,
                                      obscureText: _confirmPasswordSecureText,
                                      decoration: InputDecoration(
                                        labelText: 'Confirm Password',
                                        errorText: isRetypePasswordValid
                                            ? null
                                            : 'Field ini harus diisi.',
                                        labelStyle: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
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
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          setState(() {
                                            isRetypePasswordValid = false;
                                          });
                                          return 'Field ini harus diisi.';
                                        }
                                        setState(() {
                                          isRetypePasswordValid = true;
                                        });
                                        return null;
                                      },
                                      // validator: (confirmPassword) {
                                      //   if (confirmPassword!.isEmpty) {
                                      //     return 'Please re-enter password';
                                      //   }

                                      //   if (_passwordController.text !=
                                      //       _confirmpasswordController.text) {
                                      //     return "Password does not match";
                                      //   }

                                      //   return null;
                                      // },
                                    ),
                                    const SizedBox(height: 10),
                                    bottomSizeBox(),
                                    // const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                              bottomLogin()
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

  Widget bottomSizeBox() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff0669BD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onPressed: () {
            // ignore: unused_local_variable
            final isValidForm = _formKey.currentState!.validate();
            // ignore: unused_local_variable
            final username = _usernameController.text;
            // ignore: unused_local_variable
            final email = _emailController.text;
            // ignore: unused_local_variable
            final password = _passwordController.text;
            // ignore: unused_local_variable
            final confirmPassword = _confirmpasswordController.text;

            // ignore: unused_local_variable
            final user =
                Provider.of<UserViewModel>(context, listen: false).registerUser(
              username: username,
              email: email,
              password: password,
              retype_password: confirmPassword,
            );

            _usernameController.clear();
            _emailController.clear();
            _passwordController.clear();
            _confirmpasswordController.clear();
          },
          child: Text(
            'Create Account',
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget bottomLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account ?",
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400)),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            'Login',
            style: GoogleFonts.poppins(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
