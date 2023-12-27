import 'package:flutter/material.dart';

const List<Color> headlineTextColors = [Colors.green, Colors.red];
const Duration headlineAnimationDuration = Duration(milliseconds: 400);

class Headline extends ImplicitlyAnimatedWidget {
  final String text;
  final int index;

  const Headline({Key? key, required this.text, required this.index})
      : super(duration: headlineAnimationDuration);

  Color get targetColor => headlineTextColors[index];

  @override
  HeadlineState createState() => HeadlineState();
}

class HeadlineState extends AnimatedWidgetBaseState<Headline> {
  GhostFadeTween? _colorTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _colorTween = visitor(
      _colorTween,
      widget.targetColor,
      (color) => GhostFadeTween(begin: color),
    ) as GhostFadeTween?;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(color: _colorTween!.evaluate(animation)),
    );
  }
}

class GhostFadeTween extends Tween<Color?> {
  final Color middle = Colors.white;

  GhostFadeTween({Color? begin, Color? end}) : super(begin: begin, end: end);

  Color? lerp(double t) {
    if (t < 0.5) {
      return Color.lerp(begin, middle, t * 2);
    } else {
      return Color.lerp(middle, end, (t - 0.5) * 2);
    }
  }
}
