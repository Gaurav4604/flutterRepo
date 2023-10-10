import 'package:flutter/material.dart';
import 'package:test_app/layout_screen.dart';
import 'package:test_app/lists_and_grid_screen.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LayoutScreen()));
                  },
                  child: const Text("Layout Screen")),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListsAndGridScreen()));
                  },
                  child: const Text("Lists and Grid Screen"))
            ],
          )
        ],
      ),
    );
  }
}
