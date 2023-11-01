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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                    4, (index) => ItemWidget(content: "Item $index")),
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
        return SizedBox(
          child: Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 5),
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
