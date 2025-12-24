import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const CyberLogApp());
}

class CyberLogApp extends StatelessWidget {
  const CyberLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final screens = const [
    HomeTab(),
    LogsTab(),
    SettingsTab(),
    ChecklistTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Logs"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle), label: "Checklist"),
        ],
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String? username;
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadName();
  }

  Future<void> loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
    });
  }

  Future<void> saveName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', nameController.text);
    setState(() {
      username = nameController.text;
    });
    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (username != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Welcome, $username 👋",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: saveName,
              child: const Text("Save Name"),
            ),
          ],
        ),
      ),
    );
  }
}

class LogsTab extends StatefulWidget {
  const LogsTab({super.key});

  @override
  State<LogsTab> createState() => _LogsTabState();
}

class _LogsTabState extends State<LogsTab> {
  List<String> logs = [];
  final TextEditingController logController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadLogs();
  }

  Future<void> loadLogs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      logs = prefs.getStringList('logs') ?? [];
    });
  }

  Future<void> addLog() async {
    final prefs = await SharedPreferences.getInstance();
    logs.add(logController.text);
    await prefs.setStringList('logs', logs);
    logController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Logs")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: logController,
              decoration: const InputDecoration(
                hintText: "Enter log",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: addLog, child: const Text("Add Log")),
            Expanded(
              child: ListView(
                children: logs
                    .map((log) => Card(child: ListTile(title: Text(log))))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool darkMode = false;
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App Settings")),
      body: Column(
        children: [
          // Dark Mode Toggle (UI only)
          SwitchListTile(
            title: const Text("Dark Mode"),
            subtitle: const Text("Enable or disable dark theme"),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value; // UI change only
              });
            },
          ),

          // Notifications Toggle (already there, UI only)
          SwitchListTile(
            title: const Text("Notifications"),
            subtitle: const Text("App notifications"),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value; // UI change only
              });
            },
          ),

          const Divider(),

          // Logout Button (UI only)
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 45),
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                // No logic needed
              },
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}

class ChecklistTab extends StatefulWidget {
  const ChecklistTab({super.key});

  @override
  State<ChecklistTab> createState() => _ChecklistTabState();
}

class _ChecklistTabState extends State<ChecklistTab> {
  final tasks = ["Check passwords", "Update apps", "Scan device"];
  List<bool> status = [false, false, false];

  @override
  void initState() {
    super.initState();
    loadChecklist();
  }

  Future<void> loadChecklist() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      status = prefs
              .getStringList('checklist')
              ?.map((e) => e == 'true')
              .toList() ??
          status;
    });
  }

  Future<void> update(int index, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    status[index] = value;
    await prefs.setStringList(
        'checklist', status.map((e) => e.toString()).toList());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daily Checklist")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(tasks[index]),
            value: status[index],
            onChanged: (value) => update(index, value!),
          );
        },
      ),
    );
  }
}