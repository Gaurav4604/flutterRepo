import 'package:flutter/material.dart';
import 'package:test_app/adjustable_list.dart';
import 'package:test_app/complex_lists.dart';
import 'package:test_app/layout_screen.dart';
import 'package:test_app/lists_and_grid_screen.dart';
import 'package:test_app/long_lists.dart';
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
        "/": (context) => RoutesScreen(),
        "/layout": (context) => LayoutScreen(),
        "/lists-and-grids-1": (context) => const ListsAndGridScreen(),
        "/lists-and-grids-2": (context) => ComplexLists(),
        "/lists-and-grids-3": (context) => const AdjustableList(),
        "/lists-and-grids-4": (context) => LongLists(),
      },
      // home: HomeScreen()
    );
  }
}
