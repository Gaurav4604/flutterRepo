import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  dynamic displayValue = "unset";

  callback(String param) {
    if (mounted) setState(() => {displayValue = param});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feeling Ok?"),
        centerTitle: true,
      ),
      body: Container(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Display(callback: callback, value: displayValue),
            ButtonRow(
              callback: callback,
            )
          ],
        ),
      ),
    );
  }
}

class Display extends StatelessWidget {
  Function callback;
  String value;
  Display({Key? key, required this.callback, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(value),
    );
  }
}

class ButtonRow extends StatelessWidget {
  Function callback;
  ButtonRow({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                callback("Ok");
              },
              child: Text("Ok")),
          TextButton(
              onPressed: () {
                callback("Not Ok");
              },
              child: Text("Not Ok")),
          TextButton(
              onPressed: () {
                callback("Avg");
              },
              child: Text("Avg")),
        ],
      ),
    );
  }
}
