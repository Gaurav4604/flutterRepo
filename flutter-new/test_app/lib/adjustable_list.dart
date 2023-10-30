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
                // minWidth: constraints.maxWidth,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hi 1"),
                  // Spacer(
                  //   flex: 1,
                  // ),
                  ItemWidget(content: "hello there")
                ],
              )),
        );
      }),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String content;
  const ItemWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
          ),
          child: Container(
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(content),
          ),
        );
      },
    );
  }
}
