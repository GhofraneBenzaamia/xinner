// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class SecurityScreen extends StatelessWidget {
//   final String termsOfUse = '''
//     Welcome to MyApp!

//     By using our app, you agree to the following terms:

//     1. You must be at least 18 years old to use this app.
//     2. You are responsible for maintaining the confidentiality of your account credentials.
//     3. You may not share or distribute any content from this app without permission.
//     4. We may collect and use your data as outlined in our Privacy Policy.
//     5. Use of this app is subject to applicable laws and regulations.

//     If you have any questions or concerns, please contact us at support@MedPoint.com.

//     Thank you for using MyApp!

//     Disclaimer: This app is provided "as is" without any warranties.
//     We are not liable for any damages arising from the use of this app.

//     Extra terms:
//     - This app is designed for personal use only.
//     - Unauthorized modification or tampering with the app is prohibited.
//     - The company reserves the right to update these terms at any time.
//     - Users are encouraged to review the terms periodically for any changes.
//   ''';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Terms of Use',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Terms of Use',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Text(
//                   termsOfUse,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'For detailed terms, visit:',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[800],
//               ),
//             ),
//             SizedBox(height: 8),
//             GestureDetector(
//               onTap: () {
//                 _launchURL(context, 'https://duckduckgo.com/terms');
//               },
//               child: Text(
//                 'Click here for more terms',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.blue,
//                   decoration: TextDecoration.underline,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _launchURL(BuildContext context, String url) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => WebPageScreen(url)),
//     );
//   }
// }

// class WebPageScreen extends StatelessWidget {
//   final String url;

//   WebPageScreen(this.url);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Web Page'),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: WebView(
//         initialUrl: url,
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }
