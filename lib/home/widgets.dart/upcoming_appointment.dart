import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xinner/utils/constants/my_constants.dart';

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AppointmentDetailsPage(
                    //       date: date,
                    //       time: time,
                    //       indications: indications,
                    //       price: price,
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            child: Container(
              width: 300,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                //border:Border.all(width:2),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Row(children: [
                      SizedBox(width: 3),
                      Icon(Icons.calendar_month, color: Color(0xFF106163)),
                      Text(
                        "2001/10/25",
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
                  const Expanded(
                    child: Row(children: [
                      SizedBox(width: 3),
                      Icon(Icons.access_time, color: Color(0xFF106163)),
                      Text(
                        textAlign: TextAlign.center,
                        "10:10",
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
                  const Expanded(
                    child: Row(children: [
                      SizedBox(width: 3),
                      Icon(Icons.people, color: Color(0xFF106163)),
                      Text(
                        textAlign: TextAlign.center,
                        "10 patients",
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
  }
}
