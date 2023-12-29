import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double _width = 50;
  double _height = 50;
  Color _backgroundColor = Colors.green;
  BorderRadius _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
              color: _backgroundColor, borderRadius: _borderRadius),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _width = Random().nextInt(300).toDouble();
            _height = Random().nextInt(300).toDouble();
            _backgroundColor = Color.fromRGBO(Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256), 1);
            _borderRadius =
                BorderRadius.circular(Random().nextInt(20).toDouble());
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
