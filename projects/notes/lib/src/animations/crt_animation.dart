import 'package:flutter/material.dart';

class CRTAnimation extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const CRTAnimation({Key? key, required this.animation, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            // Use the height from the parent's constraints
            double maxHeight = constraints.maxHeight;
            double animatedHeight = maxHeight * animation.value;
            return ClipRect(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: animatedHeight,
                  child: child,
                ),
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}
