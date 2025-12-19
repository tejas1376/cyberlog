import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LogProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class LogProvider extends ChangeNotifier {
  final List<String> logs = [
    "App started",
    "Initial security check done",
  ];

  void addLog(String log) {
    logs.add(log);
    notifyListeners();
  }
}

class SettingsProvider extends ChangeNotifier {
  bool notificationsEnabled = true;

  void toggleNotifications() {
    notificationsEnabled = !notificationsEnabled;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CyberLogApp(),
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
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Provider.of<LogProvider>(context, listen: false)
              .addLog("Manual scan triggered by user");
        },
        child: const Text("Add Log Entry"),
      ),
    );
  }
}

class LogsPage extends StatelessWidget {
  const LogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logs = Provider.of<LogProvider>(context).logs;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: logs.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.security),
            title: Text(logs[index]),
          ),
        );
      },
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          title: const Text("Enable Notifications"),
          value: settings.notificationsEnabled,
          onChanged: (value) {
            settings.toggleNotifications();
          },
        ),
      ],
    );
  }
}