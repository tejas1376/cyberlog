import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = '';

  TextEditingController controller = TextEditingController();

  void checkNumber() {
    String input = controller.text;
    
    int number = int.parse(input);
    
    if (number % 2 == 0) {
      message = 'The number $number is Even.';
    } else {
      message = 'The number $number is Odd.';
    }
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Even/Odd Checker'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(
              onPressed: checkNumber,
              child: Text('Check'),
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}