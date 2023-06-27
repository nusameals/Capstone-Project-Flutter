// ignore_for_file: unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, use_build_context_synchronously, unrelated_type_equality_checks, unused_element, duplicate_ignore, prefer_final_fields

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../themes/constant.dart';
import 'profil_screen.dart';

// ignore: must_be_immutable
class UpdateProfilScreen extends StatefulWidget {
  String email;
  String username;
  String phone_number;
  String profilePicturePath;

  UpdateProfilScreen({
    Key? key,
    required this.username,
    required this.email,
    required this.phone_number,
    required this.profilePicturePath,
  }) : super(key: key);

  @override
  State<UpdateProfilScreen> createState() => _UpdateProfilScreenState();
}

class _UpdateProfilScreenState extends State<UpdateProfilScreen> {
  final formKey = GlobalKey<FormState>();
  String _newUsername = '';
  String _newEmail = '';
  String _newPhoneNumber = '';
  ImagePicker _picker = ImagePicker();
  File? _imageFile;

  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  Color _usernameLabelColor = Colors.black; // Warna label teks saat tidak aktif
  Color _emailLabelColor = Colors.black;
  Color _phoneLabelColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _newUsername = widget.username;
    _newEmail = widget.email;
    _newPhoneNumber = widget.phone_number;
    _imageFile = File('path/to/default/image.jpg');
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
    _phoneFocusNode.addListener(() {
      setState(() {
        // Mengubah warna label teks menjadi biru saat ditekan atau diklik
        _phoneLabelColor =
            _phoneFocusNode.hasFocus ? Colors.blue : Colors.black;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(useMaterial3: false),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 460,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Text(
                      'Update Profile',
                      style: ThemeText.subHeadingR20,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                imageProfile(),
                const SizedBox(height: 10),
                editProfil(),
                const SizedBox(height: 20),
                bottomUpdates()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/male.png")),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => bottomSheet(),
                );
              },
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: const Color(0xffD8D8D8)),
                  color: const Color(0xffD8D8D8),
                ),
                child: const Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose profile photo',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                  // Camera();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.image),
              ),
              Text(
                'Gallery',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    // ignore: deprecated_member_use, non_constant_identifier_names
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile! as File?;
    });
  }

  Widget editProfil() {
    return Column(
      children: [
        TextFormField(
          initialValue: _newUsername,
          focusNode: _usernameFocusNode,
          decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: _usernameLabelColor),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              )),
          cursorColor: Colors.blue,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a username';
            }
            return null;
          },
          onSaved: (value) {
            _newUsername = value!;
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          initialValue: _newEmail,
          focusNode: _emailFocusNode,
          decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: _emailLabelColor),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              )),
          cursorColor: Colors.blue,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'isi Email';
            } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
              return "Masukkan alamat email yang valid";
            }
            return null;
          },
          onSaved: (value) {
            _newEmail = value!;
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          initialValue: _newPhoneNumber,
          focusNode: _phoneFocusNode,
          decoration: InputDecoration(
              labelText: 'Phone',
              labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: _phoneLabelColor),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              )),
          cursorColor: Colors.blue,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'isi nomor telpon';
            } else if (value.length < 10 || value.length > 12) {
              return 'nomor tidak valid';
            }
            return null;
          },
          onSaved: (value) {
            _newPhoneNumber = value!;
          },
        ),
      ],
    );
  }

  Widget bottomUpdates() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff0669BD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
        ),
        onPressed: () {
          updateProfile(context);
        },
        child: Text(
          'Updates',
          style: ThemeText.bodyB145W,
        ),
      ),
    );
  }

  void updateProfile(BuildContext context) async {
    setState(() {
      widget.username = _newUsername;
      widget.email = _newEmail;
      widget.phone_number = _newPhoneNumber;
      // ignore: unnecessary_null_comparison
      final _imageFile = this._imageFile;
      if (_imageFile != null) {
        widget.profilePicturePath = _imageFile.path;
      }
    });
    // Simpan perubahan ke Shared Preferences
    await saveProfileChanges();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Profile has been updated',
          style: ThemeText.bodyR14,
        ),
        // ignore: unnecessary_const
        backgroundColor: const Color(0xffCDE1F2),
        behavior: SnackBarBehavior.floating,
      ),
    );
    // Pindahkan data ke halaman ProfilScreen
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilScreen(
          username: _newUsername,
          email: _newEmail,
          phone_number: _newPhoneNumber,
          profilePicturePath: _imageFile?.path ?? '',
        ),
      ),
    );
  }

  Future<void> saveProfileChanges() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _newUsername);
    await prefs.setString('email', _newEmail);
    await prefs.setString('phoneNumber', _newPhoneNumber);
    await prefs.setString('profilePicturePath', _imageFile?.path ?? '');
  }
}
