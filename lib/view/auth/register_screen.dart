// ignore_for_file: non_constant_identifier_names, avoid_print, unused_field
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  late SharedPreferences registerData;
  late bool newUser;
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmpasswordFocusNode = FocusNode();
  Color _usernameLabelColor = Colors.black;
  Color _emailLabelColor = Colors.black;
  Color _passwordLabelColor = Colors.black;
  Color _confirmpasswordLabelColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    _usernameFocusNode.addListener(() {
      setState(() {
        // Mengubah warna label teks menjadi biru saat ditekan atau diklik
        _usernameLabelColor =
            _usernameFocusNode.hasFocus ? Colors.blue : Colors.black;
      });
    });
    _emailFocusNode.addListener(() {
      setState(() {
        // Mengubah warna label teks menjadi biru saat ditekan atau diklik
        _emailLabelColor =
            _emailFocusNode.hasFocus ? Colors.blue : Colors.black;
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        // Mengubah warna label teks menjadi biru saat ditekan atau diklik
        _passwordLabelColor =
            _passwordFocusNode.hasFocus ? Colors.blue : Colors.black;
      });
    });
    _confirmpasswordFocusNode.addListener(() {
      setState(() {
        // Mengubah warna label teks menjadi biru saat ditekan atau diklik
        _confirmpasswordLabelColor =
            _confirmpasswordFocusNode.hasFocus ? Colors.blue : Colors.black;
      });
    });
  }

  void _checkLoginStatus() async {
    registerData = await SharedPreferences.getInstance();
    newUser = registerData.getBool('register') ?? true;

    if (newUser == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/login');
    }
  }

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
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
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
                  height: MediaQuery.of(context).size.height - 40,
                  padding: const EdgeInsets.only(top: 20),
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
                          height: MediaQuery.of(context).size.height - 40,
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
                                      focusNode: _usernameFocusNode,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: 'Username',
                                        labelStyle: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: _usernameLabelColor),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                      cursorColor: Colors.blue,
                                      // ignore: body_might_complete_normally_nullable
                                      validator: (username) {
                                        if (username!.isEmpty) {
                                          return 'Username cannot be empty';
                                        } else if (RegExp(r'^[a-z][A-Za-z]*$')
                                            .hasMatch(username)) {
                                          return 'username must start with capital letter';
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: _emailController,
                                      focusNode: _emailFocusNode,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: _emailLabelColor),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                      cursorColor: Colors.blue,
                                      validator: (email) {
                                        if (email!.isEmpty) {
                                          return "Email cannot be empty";
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
                                      focusNode: _passwordFocusNode,
                                      obscureText: _passwordSecureText,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: _passwordLabelColor),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
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
                                      cursorColor: Colors.blue,
                                      validator: (password) {
                                        if (password!.isEmpty) {
                                          return 'Please a Enter Password';
                                        } else if (password.length < 6) {
                                          return 'Enter a password with length at least 6';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: _confirmpasswordController,
                                      focusNode: _confirmpasswordFocusNode,
                                      obscureText: _confirmPasswordSecureText,
                                      decoration: InputDecoration(
                                        labelText: 'Confirm Password',
                                        errorText: isRetypePasswordValid
                                            ? null
                                            : 'Make sure the password entered is correct',
                                        labelStyle: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: _confirmpasswordLabelColor),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
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
                                      cursorColor: Colors.blue,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          setState(() {
                                            isRetypePasswordValid = false;
                                          });
                                          return 'Make sure the password entered is correct';
                                        }
                                        setState(() {
                                          isRetypePasswordValid = true;
                                        });
                                        return null;
                                      },
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
          onPressed: () async {
            if (validateAndSave()) {
              // ignore: prefer_const_declarations, unused_local_variable
              final text = 'Successefully create your account, please wait...';
              // ignore: unused_local_variable
              final snackBar = SnackBar(
                content: Text(
                  text,
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                ),
                backgroundColor: const Color(0xffCDE1F2),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              await Future.delayed(
                const Duration(seconds: 3),
              );
            }
            // ignore: unused_local_variable
            final isValidForm = _formKey.currentState!.validate();
            String Username = _usernameController.text;
            String Email = _emailController.text;
            if (isValidForm) {
              registerData.setBool('login', false);
              registerData.setString('username', Username);
              registerData.setString('email', Email);
            }
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
                // ignore: use_build_context_synchronously
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

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
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
