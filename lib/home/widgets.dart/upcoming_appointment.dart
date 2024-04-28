import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xinner/Services/firestore_services.dart';
import 'package:xinner/appointment_details/appointment_details_page.dart';
import 'package:xinner/models/appointement_model.dart';
import 'package:xinner/utils/constants/my_constants.dart';
import 'package:xinner/utils/my_formatter.dart';
// StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('forms').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (!snapshot.hasData || snapshot.data == null) {
//             return Center(child: Text('No forms available'));
//           }

//              List<Map<String, dynamic>> patientList = [];
//           snapshot.data!.docs.forEach((document) {
//             // Extract patient data from the document and add it to the patientList
//             Map<String, dynamic> patientData = {
//               'fullName': document.data()!['fullName'],
//             //  'age': document.data()!['age'],
//               // Add other patient data fields as needed
//             };
//             patientList.add(patientData);
//           });

//           return ListView.builder(
//             itemCount: patientList.length,
//             itemBuilder: (context, index) {
//               // Display each patient as a ListTile
//               return ListTile(
//                 title: Text(patientList[index]['fullName']),textColor: Colors.black,
//                 // You can also display the patient's photo here if available
//                 onTap: () {
//                   // Navigate to the form details screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PatientFormDetailsScreen(patient: patientList[index]),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('forms')
            .where("patientId", isEqualTo: FireStoreUser.getCurrentUser()!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No forms available'));
          }

          AppointementModel appointmentModel = AppointementModel.fromJson(
              snapshot.data?.docs[0].data() as Map<String, dynamic>);
          print("ID APPOI" + appointmentModel.id.toString());
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xFF106163).withOpacity(0.9),
              borderRadius: BorderRadius.circular(kRadius),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Confirmed appointment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 28,
                          color: Colors.white,
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppointmentDetailsPage(
                                appointment: appointmentModel,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      //border:Border.all(width:2),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(children: [
                            SizedBox(width: 3),
                            Icon(Icons.calendar_month,
                                color: Color(0xFF106163)),
                            Text(
                              formatMyDate(appointmentModel.appointmentDate),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF106163),
                                fontSize: 12,
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          color: const Color(0xFF106163),
                          width: 0.5,
                          height: 36,
                          margin: const EdgeInsets.only(right: 3),
                        ),
                        Expanded(
                          child: Row(children: [
                            SizedBox(width: 3),
                            Icon(Icons.access_time, color: Color(0xFF106163)),
                            Text(
                              textAlign: TextAlign.center,
                              formatMyTime(appointmentModel.appointmentDate),
                              style: TextStyle(
                                color: Color(0xFF106163),
                                fontSize: 12,
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          color: const Color(0xFF106163),
                          width: 0.5,
                          height: 36,
                          margin: const EdgeInsets.only(right: 3),
                        ),
                        Expanded(
                          child: Row(children: [
                            SizedBox(width: 3),
                            Icon(Icons.people, color: Color(0xFF106163)),
                            Text(
                              textAlign: TextAlign.center,
                              "${appointmentModel.patients} patients",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF106163),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        });
  }
}
