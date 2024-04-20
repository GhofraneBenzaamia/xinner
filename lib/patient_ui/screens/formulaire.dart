// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:xinner/patient_ui/Data/form_data.dart';
import 'package:xinner/patient_ui/screens/My_button.dart';
import 'package:xinner/patient_ui/screens/success.dart';
import 'package:xinner/patient_ui/Data/formulaire_data.dart';
// import 'package:xinner/patient_ui/Data/form_data.dart';
import 'package:xinner/utils/helper_functions.dart';
import 'package:xinner/utils/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xinner/patient_ui/screens/success.dart';

Future<bool> uploadFileForUser(PlatformFile? file) async {
  try {
    final userId = FirebaseAuth.instance.currentUser;
    final storageRef = FirebaseStorage.instance.ref();
    final fileName = file!.name; // Use PlatformFile's name property
    final filePath = file.path; // Use PlatformFile's path property

    // Convert PlatformFile to File using filePath
    File fileToUpload = File(filePath!);

    final uploadRef = storageRef.child("medicalFiles/$userId/$fileName");
    await uploadRef.putFile(fileToUpload); // Pass the File object to putFile
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

class formulaire extends StatefulWidget {
  static const String frm = "_formulaire";

  const formulaire({super.key});

  @override
  State<formulaire> createState() => _formulaireState();
}

class _formulaireState extends State<formulaire> {
  GlobalKey<FormState> formstate = GlobalKey();

  PlatformFile? selectedFile;
  PlatformFile? file;
  final fullnamecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final medicalprescriptioncontroller = TextEditingController();
  final currentmedicationscontroller = TextEditingController();
  final dateofsympcontroller = TextEditingController();
  final illnessescontroller = TextEditingController();
  final allergycontroller = TextEditingController();

  void dispose() {
    super.dispose();
    fullnamecontroller.dispose();
    agecontroller.dispose();
    phonenumbercontroller.dispose();
    medicalprescriptioncontroller.dispose();
  }

  void OpenFiles() async {
    FilePickerResult? resultfile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
      allowMultiple: true,
    );
    if (resultfile != null) {
      setState(() {
        selectedFile = resultfile.files.first;
      });
    } else {
      return;
    }
  }

  //void fileopening(PlatformFile file) {
  //OpenFile.open(file.path!);
  // }

  List<String> itemslist = ['Male', 'Female'];
  String? selectitem;

  TextEditingController fullname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'New Appointment',
            style: TextStyle(
                fontSize: screenWidth * 0.07, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formstate,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Container(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.09,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if (text!.isEmpty || text.length < 6) {
                              return "entre your name";
                            }
                            return null;
                          },
                          expands: false,
                          keyboardType: TextInputType.name,
                          controller: fullnamecontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            labelText: 'Full Name',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        width: screenWidth * 0.45,
                        height: screenHeight * 0.085,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.075),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text!.isEmpty || text.length > 3) {
                                return "entre your age";
                              }
                              return null;
                            },
                            controller: agecontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.blue)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                labelText: 'Age',
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.075),
                        child: Container(
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.085,
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            decoration: InputDecoration(
                              hintText: 'Male',
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.blue)),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05),
                            ),
                            value: selectitem,
                            items: itemslist
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.02),
                                        child: Text(item,
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.04,
                                                color: Color.fromARGB(
                                                    255, 102, 102, 102))),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (item) {
                              setState(() {
                                selectitem = item;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: Container(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.09,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          if (text!.isEmpty || text.length < 9) {
                            return "entre your phone number";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        controller: phonenumbercontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.phone_android),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: Container(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.09,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "entre no if you had not";
                          }
                          return null;
                        },
                        maxLines: 10,
                        keyboardType: TextInputType.text,
                        controller: currentmedicationscontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.medication_sharp),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: 'Current Medications',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: Container(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.09,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "entre no if you had not";
                          }
                          return null;
                        },
                        maxLines: 10,
                        keyboardType: TextInputType.text,
                        controller: dateofsympcontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.medical_services),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: 'Onset date Of Symptoms',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: Container(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.09,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "entre no if you had not ";
                          }
                          return null;
                        },
                        maxLines: 10,
                        keyboardType: TextInputType.text,
                        controller: illnessescontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.medical_services_outlined),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: 'Previous Illnesses And Surgeries',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: Container(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.09,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "entre no if you had not ";
                          }
                          return null;
                        },
                        maxLines: 10,
                        keyboardType: TextInputType.text,
                        controller: allergycontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.medical_information_sharp),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: 'Allergy History',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),
                  ElevatedButton.icon(
                    icon: Icon(
                      Icons.file_upload_outlined,
                      color: Colors.green,
                    ),
                    // do not forgot the responsive media query
                    label: selectedFile != null
                        ? Text(
                            'File Name: ${selectedFile!.name}',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 66, 66, 66),
                              fontSize: screenWidth * 0.04,
                            ),
                          )
                        : Text(
                            "Upload your medical prescriptions",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 66, 66, 66),
                              fontSize: screenWidth * 0.043,
                            ),
                          ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: screenWidth * 0.02,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      OpenFiles();
                    },
                  ),
                  /*  label: Text(
                      "upload your medical prescriptions",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 66, 66, 66)),
                    ),
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.black,
                      elevation: 5,
                      shadowColor: Colors.blue,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth *
                              0.05), // Adjust the factor as needed

                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      OpenFiles();
                    },*/

                  SizedBox(
                    height: screenHeight * 0.035,
                  ),
                  MyButton(
                      color: Colors.blue,
                      title: ('Done'),
                      onPressed: () async {
                        if (formstate.currentState!.validate()) {
                          //   int age = int.parse(agecontroller.text);
                          String gender = selectitem ?? 'Male';
                          bool success =
                              await uploadFileForUser(selectedFile) as bool;
                          print(
                              "$success  hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                          submitForm(
                            age: agecontroller.text, gender: gender,
                            fullName: fullnamecontroller.text,
                            //  age: agecontroller.text,
                            phoneNumber: phonenumbercontroller.text,
                            medicalPrescription:
                                medicalprescriptioncontroller.text,
                            currentMedications:
                                currentmedicationscontroller.text,
                            dateOfSymptoms: dateofsympcontroller.text,
                            illnessesAndSurgeries: illnessescontroller.text,
                            allergyHistory: allergycontroller.text,
                          );
                        }
                      }),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
