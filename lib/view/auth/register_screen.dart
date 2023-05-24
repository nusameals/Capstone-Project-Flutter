import 'package:flutter/material.dart';
import 'package:nusameals/view/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
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
                    const SizedBox(height: 30),
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
                                    const SizedBox(height: 25),
                                    const Text(
                                      'Create Account',
                                      style: TextStyle(
                                        fontSize: 32,
                                        color: Color(0xff0669BD),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 25),
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
                                      obscureText: _passwordSecureText,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
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
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: _confirmpasswordController,
                                      obscureText: _confirmPasswordSecureText,
                                      decoration: InputDecoration(
                                        labelText: 'Confirm Password',
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
                                    const SizedBox(height: 25),
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
                                            'Create Account',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
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
                                                      const LoginScreen(),
                                                ));
                                          },
                                          child: const Text(
                                            'Login',
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
