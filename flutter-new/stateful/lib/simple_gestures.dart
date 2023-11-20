import 'package:flutter/material.dart';

class SimpleGestures extends StatefulWidget {
  const SimpleGestures({super.key});

  @override
  State<SimpleGestures> createState() => _SimpleGesturesState();
}

class _SimpleGesturesState extends State<SimpleGestures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {
            const snackBar = SnackBar(content: Text("button tapped"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          style: FilledButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            "Press me",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
