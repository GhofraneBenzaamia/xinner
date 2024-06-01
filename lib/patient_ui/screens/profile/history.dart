import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('forms')
            .where('patientId',
                isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No history yet.'),
            );
          }

          // Group forms by patientId
          Map<String, List<DocumentSnapshot>> formsByPatientId = {};
          snapshot.data!.docs.forEach((doc) {
            var patientId = doc['patientId'];
            formsByPatientId.putIfAbsent(patientId, () => []).add(doc);
          });

          return ListView.builder(
            itemCount: formsByPatientId.length,
            itemBuilder: (context, index) {
              var patientId = formsByPatientId.keys.elementAt(index);
              var forms = formsByPatientId[patientId]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: forms.map((form) {
                  var appointmentDateField = form['appointmentDate'];
                  var appointmentDate = appointmentDateField is Timestamp
                      ? (appointmentDateField as Timestamp).toDate()
                      : null;
                  var price = form['price'];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Container(
                        width: double.infinity, // Take full width
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF106163),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Last Appointment',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFF106163),
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Date: ${appointmentDate != null ? '${appointmentDate.day}/${appointmentDate.month}/${appointmentDate.year}' : 'Not available'}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Time: ${appointmentDate != null ? '${appointmentDate.hour.toString().padLeft(2, '0')}:${appointmentDate.minute.toString().padLeft(2, '0')}' : 'Not available'}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Price: ${price != null ? '\$${price.toString()}' : 'Not available'}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}
