import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const PermissionScreen(),
    );
  }
}

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  Future<void> requestCamera() async {
    await Permission.camera.request();
  }

  Future<void> requestStorage() async {
    await Permission.manageExternalStorage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CyberLog Permissions'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PermissionCard(
              icon: Icons.camera_alt,
              title: 'Camera Permission',
              subtitle: 'Required to capture photos',
              onPressed: requestCamera,
            ),
            const SizedBox(height: 16),
            PermissionCard(
              icon: Icons.folder,
              title: 'Storage Permission',
              subtitle: 'Required to save files',
              onPressed: requestStorage,
            ),
            const SizedBox(height: 16),
            PermissionCard(
              icon: Icons.wifi,
              title: 'Internet Permission',
              subtitle: 'Used for online features',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class PermissionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const PermissionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Allow'),
            ),
          ],
        ),
      ),
    );
  }
}