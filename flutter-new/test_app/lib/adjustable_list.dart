import 'package:flutter/material.dart';

class AdjustableList extends StatelessWidget {
  const AdjustableList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LayoutBuilder(builder: (context, constraints) {
          return const SingleChildScrollView(
            child: Placeholder(),
          );
        }),
      ),
    );
  }
}
