import 'package:flutter/material.dart';

class AdjustableList extends StatelessWidget {
  const AdjustableList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // required when a widget needs to be based off the Device layout
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hi 1"),
                  Text("Hi 2"),
                  Text("Hi 3"),
                ],
              )),
        );
      }),
    );
  }
}
