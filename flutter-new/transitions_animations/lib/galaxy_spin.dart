import 'package:flutter/material.dart';

class GalaxySpin extends StatefulWidget {
  const GalaxySpin({super.key});

  @override
  State<GalaxySpin> createState() => _GalaxySpinState();
}

class _GalaxySpinState extends State<GalaxySpin>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 15))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          colorScheme: const ColorScheme.dark(background: Colors.black)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Galaxy Spin"),
        ),
        body: Theme(
          data: ThemeData(
              colorScheme: const ColorScheme.dark(background: Colors.black)),
          child: RotationTransition(
            turns: _controller,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/galaxy_transparent.png",
              height: 400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
