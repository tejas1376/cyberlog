import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogPage(),
    );
  }
}

class Log {
  String action;
  DateTime timestamp;
  String status;

  Log({
    required this.action,
    required this.timestamp,
    required this.status,
  });
}

class LogPage extends StatelessWidget {
  LogPage({super.key});

  final List<Log> logs = [
    Log(
        action: "App Started",
        timestamp: DateTime.now(),
        status: "Success"),
    Log(
        action: "User Logged In",
        timestamp: DateTime.now(),
        status: "Success"),
    Log(
        action: "Data Fetching",
        timestamp: DateTime.now(),
        status: "Pending"),
    Log(
        action: "Background Task",
        timestamp: DateTime.now(),
        status: "Failed"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Logs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: logs.map((log) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                "${log.action} — ${log.timestamp.toString()}",
                style: const TextStyle(fontSize: 18),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}