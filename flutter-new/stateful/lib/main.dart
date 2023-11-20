import 'package:flutter/material.dart';
import 'package:stateful/drag_drop_gestures.dart';
import 'package:stateful/simple_gestures.dart';
import 'package:stateful/simple_stateful_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Home(),
        "/stateful_layout": (context) => LayoutScreen(),
        "/gesture_basic_with_snackbar": (context) => const SimpleGestures(),
        "/gesture_drag_drop": (context) => const DragDrop(),
      },
      initialRoute: "/",
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final List<String> routes = [
    "stateful_layout",
    "gesture_basic_with_snackbar",
    "gesture_drag_drop"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverList.builder(
              itemCount: routes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(routes[index]),
                  onTap: () =>
                      Navigator.pushNamed(context, "/${routes[index]}"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
