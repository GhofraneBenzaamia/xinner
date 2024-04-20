import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendNotificationToFCM(String serverKey, String deviceToken, String title, String body) async {
  try {
    final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };
    final data = {
      'notification': {
        'body': body,
        'title': title,
      },
      'priority': 'high',
      'data': {
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'sound': 'default',
      },
      'to': deviceToken,
    };
    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification. Error: ${response.body}');
    }
  } catch (e) {
    print('Exception while sending notification: $e');
  }
}
