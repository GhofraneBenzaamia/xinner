// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:radioapp/button/My_button.dart';
import 'package:radioapp/screens/success.dart';

class formulaire extends StatefulWidget {
  static const String frm = "_formulaire";

  const formulaire({super.key});

  @override
  State<formulaire> createState() => _formulaireState();
}

class _formulaireState extends State<formulaire> {
  GlobalKey<FormState> formstate = GlobalKey();

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
      PlatformFile file = resultfile.files.first;
      //fileopening(file);
      print(file.name);
      print(file.bytes);
      print(file.extension);
      print(file.path);
    } else {
      return;
    }
  }

  void fileopening(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  List<String> itemslist = ['Male', 'Female'];
  String? selectitem;

  TextEditingController fullname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        title: const Text(
          'New Appointment',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.close))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formstate,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 250, 0),
                  child: Text(
                    'Full Name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 350,
                    height: 55,
                    /* decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),*/
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          if (text!.isEmpty || text.length < 6) {
                            return "entre your name";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        controller: fullnamecontroller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blue)),
                          // border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'entre your full name',
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 20, 0, 10),
                        child: Text(
                          'Age',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(26, 20, 0, 10),
                        child: Text(
                          'Gendre',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        width: 150,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text!.isEmpty || text.length > 3) {
                                return "entre your age";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.blue)),
                              //border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'entre age',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(67, 0, 0, 10),
                      child: Container(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: "Male",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.black)),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0), // Adjust padding if needed
                          ),
                          value: selectitem,
                          items: itemslist
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(item,
                                          style: TextStyle(
                                              fontSize: 15,
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
                        height: 50,
                        width: 140,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 200, 10),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 350,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0), //horizontal:20
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
                            prefixIcon: Icon(Icons.phone_android),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.blue)),
                            // border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: '+213**********'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 145, 10),
                  child: Text(
                    'Current Medications',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 1.2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 350,
                    height: 65,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0), //horizontal:20
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
                            //  border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'enter our medicactions if you have'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 100, 10),
                  child: Text(
                    'Onset Date of Symptoms',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 350,
                    height: 65,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0), //horizontal:20
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
                            prefixIcon: Icon(Icons.date_range),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.blue)),
                            //  border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'enter if you had'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 27, 10),
                  child: Text(
                    'Previous Illnesses and Surgeries',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 350,
                    height: 65,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0), //horizontal:20
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
                        controller: illnessescontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.local_hospital_outlined),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.blue)),
                            //   border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'enter if you had'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 184, 10),
                  child: Text(
                    'Allergy History',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 1.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 350,
                    height: 65,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0), //horizontal:20
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
                        controller: allergycontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.medical_information),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.blue)),
                            // border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'enter if you had'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 150, 10),
                  child: Text(
                    'Medical prescription',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 4),
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.file_upload_outlined,
                    color: Colors.green,
                  ),
                  label: Text(
                    "upload your medical prescriptions",
                    style:
                        TextStyle(color: const Color.fromARGB(255, 66, 66, 66)),
                  ),
                  style: ElevatedButton.styleFrom(
                    surfaceTintColor: Colors.black,
                    elevation: 5,
                    shadowColor: Colors.blue,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                 
                  onPressed: () {
                    OpenFiles();
                  },
                 
                ),
                SizedBox(
                  height: 40,
                ),
                MyButton(
                    color: Colors.blue,
                    title: ('Done'),
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        Navigator.pushNamed(context, success.frm);
                      }
                    }),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
