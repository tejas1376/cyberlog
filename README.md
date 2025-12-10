Log Feature (Classes + List Iteration)
1. How Classes Were Used

I created a custom Dart class named Log with three properties:

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


This class acts like a blueprint for each log entry.
Instead of using separate variables for each item, the class helps keep the data organized, clean, and reusable.

2. How List Iteration Was Used to Render Widgets

Inside a StatelessWidget, I created a list containing several Log objects:

final List<Log> logs = [
  Log(action: "App Started", timestamp: DateTime.now(), status: "Success"),
  Log(action: "User Logged In", timestamp: DateTime.now(), status: "Success"),
  Log(action: "Data Fetching", timestamp: DateTime.now(), status: "Pending"),
];


To display them on the screen, I used map(), which loops through each Log and returns a Text widget for it:

children: logs.map((log) {
  return Text("${log.action} — ${log.timestamp}");
}).toList(),


This method is efficient because:

No manual loop (for) is needed

It automatically converts each Log into a widget

It keeps the UI clean and easy to maintain

You can add more logs without changing the code structure