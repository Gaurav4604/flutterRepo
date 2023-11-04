import 'package:flutter/material.dart';
import 'package:test_app/adjustable_list.dart';
import 'package:test_app/complex_lists.dart';
import 'package:test_app/layout_screen.dart';
import 'package:test_app/lists_and_grid_screen.dart';
import 'package:test_app/long_lists.dart';

class Route {
  final Widget page;
  final String pageDisplayName;

  Route(this.page, this.pageDisplayName);

  Widget renderRouteToPage(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Text(pageDisplayName));
  }
}

class RoutesScreen extends StatelessWidget {
  RoutesScreen({super.key});

  final items = [
    Route(LayoutScreen(), "Layout Screen"),
    Route(const ListsAndGridScreen(), "Lists and Grid 1"),
    Route(ComplexLists(), "Lists and Grid 2"),
    Route(const AdjustableList(), "Lists and Grid 3"),
    Route(LongLists(), "Lists and Grid 4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return items[index].renderRouteToPage(context);
        },
        itemCount: items.length,
      ),
    );
  }
}
