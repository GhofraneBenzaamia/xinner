// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

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

class UpcomingAppointment extends StatefulWidget {
  const UpcomingAppointment({super.key});

  @override
  State<UpcomingAppointment> createState() => _UpcomingAppointmentState();
}

class _UpcomingAppointmentState extends State<UpcomingAppointment> {
  /*Stream<int> countAppointmentsBeforeMeStream(String patientId) {
    return FirebaseFirestore.instance
        .collection('forms')
        .where('patientId', isEqualTo: patientId)
        .snapshots()
        .asyncMap<int>((snapshot) async {
      if (snapshot.docs.isEmpty) {
        // Handle the case where no document is found for the given patientId
        return 0;
      }

      // Access the appointmentDate attribute from the fetched document
      DateTime myAppointmentDate =
          snapshot.docs.first.data()['appointmentDate'].toDate();
          print(AppointmentDate);
    print(myAppointmentDate);
      // Query the Firestore collection to count appointments before the appointment date of the patient
      final QuerySnapshot<Map<String, dynamic>> appointmentsSnapshot =
          await FirebaseFirestore.instance
              .collection('forms')
              .where('status', isEqualTo: 3)
              .where('appointmentDate', isLessThan: myAppointmentDate)
              .get();

      return appointmentsSnapshot.docs.length;
    });
  }*/
   DateTime? AppointmentDate=null; // Declare myAppointmentDate here
 /* @override
  void initState() {
    super.initState();
    AppointmentDate = null; // Initialize AppointmentDate with null
  }*/

  Stream<int> gg(String patientId) {
    return FirebaseFirestore.instance
        .collection('forms')
        .where('patientId', isEqualTo: patientId)
        .snapshots()
        .asyncMap<int>((snapshot) async {
      if (snapshot.docs.isEmpty) {
        // Handle the case where no document is found for the given patientId
        return 0;
      }

      // Assign the value to myAppointmentDate here
      AppointmentDate = snapshot.docs.first.data()['appointmentDate'].toDate();

      // Query the Firestore collection to count appointments before the appointment date of the patient
      final QuerySnapshot<Map<String, dynamic>> appointmentsSnapshot =
          await FirebaseFirestore.instance
              .collection('forms')
              .where('status', isEqualTo: 3)
              .where('appointmentDate', isLessThan: AppointmentDate)
              .get();

      return appointmentsSnapshot.docs.length;
    });
  }

  @override
  Widget build(BuildContext context) {
      print("app");
      print(AppointmentDate);
    final formattedTime = AppointmentDate != null ? formatMyTime(AppointmentDate!) : '';
    final formattedDate = AppointmentDate != null ? formatMyDate(AppointmentDate!) : '';
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('forms')
            .where("patientId", isEqualTo: FireStoreUser.getCurrentUser()!.uid)
            .where("status", isLessThanOrEqualTo: 3)
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
          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No forms available'));
          }
          AppointementModel appointmentModel = AppointementModel.fromJson(
              snapshot.data?.docs[0].data() as Map<String, dynamic>);
          print("ID APPOI" + appointmentModel.id.toString());
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: appointmentModel.status == 0
                  ? Colors.grey[900]
                  : Color(0xFF106163).withOpacity(0.9),
              borderRadius: BorderRadius.circular(kRadius),
            ),
            child: appointmentModel.status == 0
                ? WeReceivedYourAppointement(
                    appointementModel: appointmentModel)
                : appointmentModel.status == 2
                    ? AppointementDeclined(appointementModel: appointmentModel)
                    : Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "✅️ Confirmed appointment",
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
                                        builder: (context) =>
                                            AppointmentDetailsPage(
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
                                        formattedDate,
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
                                      Icon(Icons.access_time,
                                          color: Color(0xFF106163)),
                                      Text(
                                        textAlign: TextAlign.center,
                                        formattedTime,
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
                                    child: Row(
                                      children: [
                                        SizedBox(width: 3),
                                        Icon(Icons.people,
                                            color: Color(0xFF106163)),
                                        StreamBuilder<int>(
                                          stream:
                                              gg(
                                                  appointmentModel.patientId!),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<int> snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Text(
                                                'Loading...', // Show loading indicator while waiting for data
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF106163),
                                                ),
                                              );
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                'Error', // Show error if any
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF106163),
                                                ),
                                              );
                                            } else {
                                              return Text(
                                                snapshot.data == 0
                                                    ? "Your turn !"
                                                    : '${snapshot.data ?? 0} patients', // Display the count
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: snapshot.data == 0
                                                      ? Colors.red
                                                      : Color(0xFF106163),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
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

class WeReceivedYourAppointement extends StatelessWidget {
  const WeReceivedYourAppointement(
      {super.key, required this.appointementModel});
  final AppointementModel appointementModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "✅️ appointement Received",
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          "We have received your apppointement, the doctor will look at it and set for you a date and time to come",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class AppointementDeclined extends StatelessWidget {
  const AppointementDeclined({super.key, required this.appointementModel});
  final AppointementModel appointementModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "❌ appointement Refused",
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
                        appointment: appointementModel,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          "We have refused your apppointement, click on the arrow to display the reason",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
