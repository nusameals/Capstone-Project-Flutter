import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
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
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 41),
                                    const Text(
                                      'Create Account',
                                      style: TextStyle(
                                        fontSize: 32,
                                        color: Color(0xff0669BD),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 41),
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                      ),
                                      validator: (email) {
                                        // 5 install package email_validator
                                        if (email != null &&
                                            !EmailValidator.validate(email)) {
                                          return 'Enter a valid email';
                                        } else {
                                          return null; //form is valid
                                        }
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
                                      validator: (value) {
                                        if (value != null && value.length < 5) {
                                          return 'Enter min. 5 characters';
                                        } else {
                                          return null; //form is valid
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: _confirmpasswordController,
                                      obscureText: _secureText,
                                      decoration: InputDecoration(
                                        labelText: 'Confirm Password',
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
                                      validator: (value) {
                                        if (value != null && value.length < 5) {
                                          return 'Enter min. 5 characters';
                                        } else {
                                          return null; //form is valid
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 33),
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
                                          onPressed: () {},
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
                                    const SizedBox(height: 33),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("Don't have an account ?"),
                                        TextButton(
                                          onPressed: () {},
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
