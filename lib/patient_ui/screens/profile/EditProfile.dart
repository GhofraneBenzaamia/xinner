import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'dart:typed_data';

class EditProfile extends StatefulWidget {
  final Function()? onProfilePictureUpdated; // Make the parameter optional

  EditProfile({this.onProfilePictureUpdated});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker picker = ImagePicker();
  String? _imageUrl;

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();

    // Fetch user data from Firestore and set it to controllers
    fetchUserData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        setState(() {
          _nameController.text = userData['name'] ?? '';
          _emailController.text = userData['email'] ?? '';
          _phoneNumberController.text = userData['phoneNumber'] ?? '';
          _imageUrl = userData['profilePicture'];
        });
      }
    }
  }

  Future<void> editField(String field, String newValue) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        if (field == 'email') {
          await user.updateEmail(newValue);
        } else {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({field: newValue}); // Update the specified field
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile updated successfully'),
          ),
        );
      } catch (e) {
        print('Error updating field: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update profile. Please try again.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Center(
              child: Stack(
                children: [
                  _imageUrl != null
                      ? CircleAvatar(
                          radius: 65,
                          backgroundImage:
                              NetworkImage(_imageUrl!), // Load image from URL
                        )
                      : CircleAvatar(
                          radius: 65,
                          backgroundImage: AssetImage('assets/images/pict.png'),
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {
                        // Pick new image from gallery and update user profile
                        Uint8List? pickedImage =
                            await pickImage(ImageSource.gallery);
                        if (pickedImage != null) {
                          await uploadImageToStorage(pickedImage);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildEditableField("Full Name", Icons.person, _nameController),
            SizedBox(height: 20),
            _buildEditableField("Email", Icons.email, _emailController),
            SizedBox(height: 20),
            _buildEditableField(
                "Phone Number", Icons.phone, _phoneNumberController),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                String newName = _nameController.text.trim();
                String newEmail = _emailController.text.trim();
                String newPhoneNumber = _phoneNumberController.text.trim();
                if (isFullNameValid(newName) &&
                    isEmailValid(newEmail) &&
                    isPhoneNumberValid(newPhoneNumber)) {
                  await editField("name", newName);
                  await editField("email", newEmail);
                  await editField("phoneNumber", newPhoneNumber);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Please enter valid information in all fields'),
                    ),
                  );
                }
              },
              child: Text("Save"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(
      String labelText, IconData icon, TextEditingController controller) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: controller,
            keyboardType:
                icon == Icons.phone ? TextInputType.phone : TextInputType.text,
            inputFormatters: [
              FilteringTextInputFormatter.singleLineFormatter,
              if (icon == Icons.phone) LengthLimitingTextInputFormatter(10),
              // Limit input to 10 characters for phone number
            ],
            decoration: InputDecoration(
              labelText: labelText,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  bool isFullNameValid(String fullName) {
    List<String> nameParts = fullName.trim().split(' ');
    return nameParts.length >= 2;
  }

  bool isEmailValid(String email) {
    return RegExp(
            r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$', // Email regex
            caseSensitive: false)
        .hasMatch(email.trim());
  }

  bool isPhoneNumberValid(String phoneNumber) {
    return phoneNumber.trim().length == 10 && int.tryParse(phoneNumber) != null;
  }

  Future<Uint8List?> pickImage(ImageSource source) async {
    final XFile? pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      return await imageFile.readAsBytes();
    }
    return null;
  }

  Future<void> uploadImageToStorage(Uint8List imageBytes) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference storageReference =
            storage.ref().child('profile_pictures/${user.uid}.jpg');
        TaskSnapshot taskSnapshot = await storageReference.putData(imageBytes);
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        // Call the onProfilePictureUpdated callback if provided
        widget.onProfilePictureUpdated?.call();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'profilePicture': downloadUrl});

        setState(() {
          _imageUrl = downloadUrl; // Update the image URL
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile picture updated successfully'),
          ),
        );
      }
    } catch (e) {
      print('Error uploading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update profile picture.'),
        ),
      );
    }
  }
}
