import 'package:flutter/material.dart';

class resonsive extends StatefulWidget {
  const resonsive({super.key});

  @override
  State<resonsive> createState() => _resonsiveState();
}

class _resonsiveState extends State<resonsive> {
  @override
  Widget build(BuildContext context) {
    final currentwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(child: Text(currentwidth.toString())),
    );
  }
}
