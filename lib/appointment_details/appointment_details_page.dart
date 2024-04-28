import 'package:flutter/material.dart';
import 'package:xinner/models/appointement_model.dart';
import 'package:xinner/utils/my_formatter.dart';

class AppointmentDetailsPage extends StatelessWidget {
  final AppointementModel appointment;

  const AppointmentDetailsPage({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Date:',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  formatMyDate(appointment.appointmentDate),
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Time:',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  formatMyTime(appointment.appointmentDate),
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Price:',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  appointment.price.toString(),
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Indications:',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              appointment.indications.toString(),
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
