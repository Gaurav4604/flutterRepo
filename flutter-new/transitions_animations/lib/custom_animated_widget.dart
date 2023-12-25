import 'dart:math';

import 'package:flutter/material.dart';

class LightRayTransition extends StatefulWidget {
  const LightRayTransition({super.key});

  @override
  State<LightRayTransition> createState() => _LightRayTransitionState();
}

class _LightRayTransitionState extends State<LightRayTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addStatusListener((status) => print("$status"))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Light Ray"),
      ),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation:
                  CurvedAnimation(parent: _controller, curve: ShakeCurve()),
              builder: (context, child) {
                return Container(
                    color: Colors.red,
                    height: 800 * _controller.value,
                    width: 20);
              },
            ),
            RayTransition(animation: _controller)
          ]),
    );
  }
}

class RayTransition extends AnimatedWidget {
  const RayTransition({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Container(
        color: Colors.red, height: 800 * animation.value, width: 20);
  }
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) => sin(t * pi * 2);
}
