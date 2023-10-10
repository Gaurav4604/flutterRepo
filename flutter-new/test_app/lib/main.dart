import 'package:flutter/material.dart';
import 'package:test_app/layout_screen.dart';
import 'package:test_app/lists_and_grid_screen.dart';
import 'package:test_app/routes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First Layout!",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const RoutesScreen(),
        "/layout": (context) => LayoutScreen(),
        "/lists-and-grids": (context) => const ListsAndGridScreen()
      },
      // home: HomeScreen()
    );
  }
}
