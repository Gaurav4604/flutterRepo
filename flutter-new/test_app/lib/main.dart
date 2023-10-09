import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "First App after long time",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Hello There"),
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello World!",
                  textDirection: TextDirection.ltr,
                ),
                Text(
                  "Another Text Widget!",
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ));
  }
}
