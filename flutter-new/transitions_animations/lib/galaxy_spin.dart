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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
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
              Align(
                alignment: Alignment.bottomCenter,
                child: TimeStopper(controller: _controller),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimeStopper extends StatelessWidget {
  final AnimationController controller;
  const TimeStopper({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.isAnimating) {
          controller.stop();
        } else {
          controller.repeat();
        }
      },
      child: Container(
        color: Colors.transparent,
        width: 300,
        height: 300,
      ),
    );
  }
}
