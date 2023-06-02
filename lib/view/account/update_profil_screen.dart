// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfilScreen extends StatefulWidget {
  const UpdateProfilScreen({super.key});

  @override
  State<UpdateProfilScreen> createState() => _UpdateProfilScreenState();
}

class _UpdateProfilScreenState extends State<UpdateProfilScreen> {
  final formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    style:
                        GoogleFonts.poppins(fontSize: 22, color: Colors.black),
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
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              IconButton(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
              ),
              Text(
                'Gallery',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    // ignore: deprecated_member_use, non_constant_identifier_names
    final PickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = PickedFile!;
    });
  }

  Widget editProfil() {
    return Column(
      children: [
        TextFormField(
          controller: _usernameController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelText: 'Username',
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _phoneNumberController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Phone',
          ),
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
        onPressed: () {},
        child: Text(
          'Updates',
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
