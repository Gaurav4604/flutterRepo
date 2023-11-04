import 'package:flutter/material.dart';

class LongLists extends StatelessWidget {
  LongLists({super.key});

  // long list of data
  final items = List<String>.generate(10000, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Longgg Lists"),
      ),
      body: ListView.builder(
          // item length defined
          itemCount: items.length,
          // item skeleton defined
          prototypeItem: ListTile(
            title: Text(items.first),
          ),
          // item rendering
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          }),
    );
  }
}
