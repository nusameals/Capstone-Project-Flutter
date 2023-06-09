import 'package:flutter/material.dart';
import 'package:nusameals/view/account/update_profil_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../themes/constant.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  late SharedPreferences loginData;
  // ignore: non_constant_identifier_names
  String Username = '';
  // ignore: non_constant_identifier_names
  String Email = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      Username = loginData.getString('username').toString();
      Email = loginData.getString('email').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(useMaterial3: false),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: const Color(0xff0669BD),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Text(
            'Profile',
            style: ThemeText.subHeadingR20W,
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                  color: Color(0xff0669BD),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(
                    left: 24, right: 24, top: 18, bottom: 370),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8, left: 8),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage("assets/images/male.png"),
                          ),
                          const SizedBox(width: 10, height: 21),
                          Text(
                            Username,
                            style: ThemeText.subHeadingB20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Color(0xff6AA5D7),
                    ),
                    const SizedBox(height: 20),
                    profilBuilder(),
                    const SizedBox(height: 24),
                    bottomUpdate(),
                  ],
                ),
              ),
              bottomLogout()
            ],
          ),
        ),
      ),
    );
  }

  Widget profilBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Username',
                style: ThemeText.bodyR14,
              ),
              Text(
                Username,
                style: ThemeText.bodyR14,
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Email',
                style: ThemeText.bodyR14,
              ),
              Text(
                Email,
                style: ThemeText.bodyR14,
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Phone',
                style: ThemeText.bodyR14,
              ),
              Text(
                '-',
                style: ThemeText.bodyR14,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomUpdate() {
    return SizedBox(
      width: 340,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff0669BD),
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
            builder: (context) => UpdateProfilScreen(
                username: Username,
                email: Email,
                phoneNumber: '-',
                profilePicturePath: ''),
          );
        },
        child: Text(
          'Update Profile',
          style: ThemeText.bodyB145W,
        ),
      ),
    );
  }

  Widget bottomLogout() {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: Colors.grey),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            loginData.setBool('login', true);

            Navigator.pushNamed(context, '/login');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: const BorderSide(
                color: Colors.red,
              ),
            ),
          ),
          child: const Text(
            'Logout',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
