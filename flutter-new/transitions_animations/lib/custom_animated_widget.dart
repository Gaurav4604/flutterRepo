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
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
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
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
              color: Colors.red, height: 1000 * _controller.value, width: 20);
        },
      ),
    );
  }
}
