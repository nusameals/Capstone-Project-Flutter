import 'package:flutter/material.dart';
import 'package:nusameals/view/auth/register_screen.dart';
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
    void showSnackbar(BuildContext context) {
      const snackBar = SnackBar(
        content: Text(
          'Successfully. Please wait... ',
          style: TextStyle(color: Color(0XFFCDE1F2), fontSize: 14),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
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
                                    const Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 32,
                                        color: Color(0xff0669BD),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 31),
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                      ),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(),
                                        TextButton(
                                          onPressed: () {
                                            // tampilkan modal forgot password
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  top: Radius.circular(20),
                                                ),
                                              ),
                                              builder: (context) =>
                                                  const ForgotPasswordScreen(),
                                            );
                                          },
                                          child: const Text(
                                            'Forgot Password',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
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
                                            if (formKey.currentState!
                                                .validate()) {
                                              print("Successfully");
                                            } else {
                                              print('Unsuccessfully');
                                            }
                                          },
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("Don't have an account ?"),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegisterScreen(),
                                                ));
                                          },
                                          child: const Text(
                                            'Create Account',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )
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
}
