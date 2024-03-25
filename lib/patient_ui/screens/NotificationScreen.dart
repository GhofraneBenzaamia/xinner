import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, String>> notifications = [
    {'time': '2022_10_10 at 10:05 PM', 'message': 'Lorem ipsum dolor sit amet aaaa consectetur.'},
    // Add more notification data as needed
  ];
  String  mess = 'Lorem ipsum dolor sit amet aaaa consectetur.' ;

  @override
  void initState() {
    super.initState();

    // Call the function to add a new notification with a custom message in initState
    addNewNotification(mess);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Container(
          height: 400,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Center(
              child: ListTile(
                title: const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  '                                                                  ',
                ),
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 80),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return buildNotificationCard(notifications[index]);
                },
                itemCount: notifications.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationCard(Map<String, String> notificationData) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 200,
      margin: const EdgeInsets.fromLTRB(7, 3, 7, 3),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 184, 175, 175)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.notifications,
          size: 50,
          color: Color(0xff106163),
        ),
        title: Text(
          notificationData['time'] ?? '',
          style: const TextStyle(
            color: Color.fromARGB(255, 132, 131, 131),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          notificationData['message'] ?? '',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  // Function to add a new notification with a custom message
  void addNewNotification(String message) {
    setState(() {
      final DateTime now = DateTime.now();
      final String formattedTime = '${now.year}_${now.month}_${now.day} at ${now.hour}:${now.minute} ${now.hour >= 12 ? 'PM' : 'AM'}';

      notifications.insert(
        0,
        {'time': formattedTime, 'message': message},
      );
    });
  }
}