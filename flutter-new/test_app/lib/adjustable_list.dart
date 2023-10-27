import 'package:flutter/material.dart';

class AdjustableList extends StatelessWidget {
  const AdjustableList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // required when a widget needs to be based off the Device layout
      body: LayoutBuilder(builder: (context, constraints) {
        return const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hi 1"),
              Text("Hi 2"),
              Text("Hi 3"),
            ],
          ),
        );
      }),
    );
  }
}
