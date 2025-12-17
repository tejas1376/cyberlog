import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CyberLogApp(),
    );
  }
}

class CyberLogApp extends StatefulWidget {
  const CyberLogApp({super.key});

  @override
  State<CyberLogApp> createState() => _CyberLogAppState();
}

class _CyberLogAppState extends State<CyberLogApp> {
  int currentIndex = 0;

  // Pages list
  final List<Widget> pages = const [
    HomePage(),
    LogsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CyberLog"),
        centerTitle: true,
      ),

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Logs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Welcome to CyberLog",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class LogsPage extends StatelessWidget {
  const LogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.security),
            title: Text("Login Attempt"),
            subtitle: Text("Checked device security"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.wifi),
            title: Text("Network Scan"),
            subtitle: Text("WiFi security verified"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.lock),
            title: Text("Password Update"),
            subtitle: Text("Password changed successfully"),
          ),
        ),
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Profile"),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notifications"),
        ),
        ListTile(
          leading: Icon(Icons.privacy_tip),
          title: Text("Privacy"),
        ),
      ],
    );
  }
}