import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusameals/view/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void showSnackbar(BuildContext context) {
      const snackBar = SnackBar(
        content: Text(
          'Successfully create your account. Please wait... ',
          style: TextStyle(color: Color(0XFFCDE1F2), fontSize: 14),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

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
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      'Create Account',
                                      style: GoogleFonts.poppins(
                                        fontSize: 32,
                                        color: const Color(0xff0669BD),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: _usernameController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: 'Username',
                                        labelStyle:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
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
                                        labelStyle:
                                            GoogleFonts.poppins(fontSize: 16),
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
                                        labelStyle:
                                            GoogleFonts.poppins(fontSize: 16),
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
                                        labelStyle:
                                            GoogleFonts.poppins(fontSize: 16),
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
                                      validator: (confirmPassword) {
                                        if (confirmPassword!.isEmpty) {
                                          return 'Please re-enter password';
                                        }

                                        if (_passwordController.text !=
                                            _confirmpasswordController.text) {
                                          return "Password does not match";
                                        }

                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    bottomSizeBox(),
                                    const SizedBox(height: 10),
                                    bottomLogin()
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
            if (formKey.currentState!.validate()) {
              print("Successfully");
            } else {
              print('Unsuccessfully');
            }
          },
          child: Text(
            'Create Account',
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
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
            style: GoogleFonts.poppins(fontSize: 14)),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
          },
          child: Text(
            'Login',
            style: GoogleFonts.poppins(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
