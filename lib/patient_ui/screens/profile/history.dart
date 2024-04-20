import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Map<String, String>> historyItems = [];
  String message = 'Ceci est votre historique.';

  @override
  void initState() {
    super.initState();
    addNewHistoryItem(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: historyItems.isEmpty ? buildIllustration() : buildHistoryList(),
      ),
    );
  }

  Widget buildIllustration() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.history,
          size: 200,
          color: Colors.blueGrey, // Change the icon color to green
        ),
        SizedBox(height: 20),
        Text(
          'No History Items',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildHistoryList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return buildHistoryItemCard(historyItems[index]);
        },
        itemCount: historyItems.length,
      ),
    );
  }

  Widget buildHistoryItemCard(Map<String, String> historyItemData) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 200,
      margin:
          const EdgeInsets.fromLTRB(16, 8, 16, 8), // Adjust margin for spacing
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          Icons.history,
          size: 50,
          color: Colors.green, // Change the icon color to green
        ),
        title: Text(
          historyItemData['time'] ?? '',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          historyItemData['message'] ?? '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void addNewHistoryItem(String message) {
    setState(() {
      final DateTime now = DateTime.now();
      final String formattedTime =
          '${now.year}_${now.month}_${now.day} at ${now.hour}:${now.minute} ${now.hour >= 12 ? 'PM' : 'AM'}';

      historyItems.insert(
        0,
        {'time': formattedTime, 'message': message},
      );
    });
  }
}
