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
        title: Text(
          'Appointment Details',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (appointment.appointmentDate != null)
              Text(
                'Date : ${formatMyDate(appointment.appointmentDate)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            if (appointment.appointmentDate != null) SizedBox(height: 10),
            if (appointment.appointmentDate != null)
              Text(
                'Time : ${formatMyTime(appointment.appointmentDate)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            if (appointment.price != null)
              Row(
                children: [
                  SizedBox(height: 10),
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
/*
            SizedBox(height: 10),
            if (appointment.dateOfSymptoms != null)
              Text(
                'Date of symptoms: ${appointment.appointmentDate.toString()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),*/
            SizedBox(height: 10),
            if (appointment.reasonForRefuse != null)
              Text(
                'Refuse Reason : ${appointment.reasonForRefuse.toString()}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
