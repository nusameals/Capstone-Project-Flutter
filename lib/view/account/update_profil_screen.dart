// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class UpdateProfilScreen extends StatefulWidget {
  String email;
  String username;
  String phoneNumber;
  String profilePicturePath;

  UpdateProfilScreen({
    Key? key,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicturePath,
  }) : super(key: key);

  @override
  State<UpdateProfilScreen> createState() => _UpdateProfilScreenState();
}

class _UpdateProfilScreenState extends State<UpdateProfilScreen> {
  final formKey = GlobalKey<FormState>();
  late String _newUsername;
  late String _newEmail;
  late String _newPhoneNumber;

  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

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
    _newPhoneNumber = widget.phoneNumber;
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
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
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
              backgroundImage: AssetImage("assets/images/user1.jpg")),
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
                  takePhoto(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
              ),
              Text(
                'Camera',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              IconButton(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
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
      _imageFile = pickedFile!;
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
              return 'Please enter an email';
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
              return 'Please enter a phone number';
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
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            updateProfile();
          }
        },
        child: Text(
          'Updates',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void updateProfile() {
    // Simulate update profile process
    // You can replace this with your own implementation
    setState(() {
      widget.username = _newUsername;
      widget.email = _newEmail;
      widget.phoneNumber = _newPhoneNumber;
      // ignore: unnecessary_null_comparison
      if (_imageFile != null) {
        widget.profilePicturePath = _imageFile.path;
      }
    });

    // Show success message
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Profile updated successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
