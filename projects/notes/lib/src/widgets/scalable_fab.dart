import 'package:flutter/material.dart';

class ScalableFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPress; // Changed from Function? for specificity
  final double scale; // Include scale as a required parameter

  const ScalableFloatingActionButton({
    super.key,
    required this.onPress,
    required this.scale, // Make scale a required field
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: scale, // Use the scale parameter
      duration: const Duration(milliseconds: 300),
      child: FloatingActionButton(
        onPressed: onPress,
        tooltip: 'Increment',
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
