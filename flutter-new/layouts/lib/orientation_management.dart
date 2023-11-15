import 'package:flutter/material.dart';

class OrientationManagement extends StatelessWidget {
  const OrientationManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orientation Management"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return CustomScrollView(
            slivers: [
              SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      "Item $index",
                      style: Theme.of(context).textTheme.displayLarge,
                    );
                  })
            ],
          );
        },
      ),
    );
  }
}
