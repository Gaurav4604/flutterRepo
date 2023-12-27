import 'package:flutter/material.dart';

const List<Color> headlineTextColors = [Colors.green, Colors.red];
const List<String> headline = ["Base Animation Green!", "Base Animation Red!"];
const Duration headlineAnimationDuration = Duration(milliseconds: 400);

class Headline extends ImplicitlyAnimatedWidget {
  final String text;
  final int index;

  const Headline({Key? key, required this.text, required this.index})
      : super(duration: headlineAnimationDuration, key: key);

  Color get targetColor => headlineTextColors[index];

  String get targetString => headline[index];

  @override
  HeadlineState createState() => HeadlineState();
}

class HeadlineState extends AnimatedWidgetBaseState<Headline> {
  GhostFadeTween? _colorTween;
  StringSwitchTween? _stringSwitchTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    // in each of the cases, we only pass the begin value,
    // but when the value e.g. widget.targetColor, changes
    // the function knows to pass it as the end value

    _colorTween = visitor(
      _colorTween,
      widget.targetColor,
      (color) => GhostFadeTween(begin: color),
    ) as GhostFadeTween?;

    _stringSwitchTween = visitor(
      _stringSwitchTween,
      widget.targetString,
      (value) => StringSwitchTween(begin: value),
    ) as StringSwitchTween?;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _stringSwitchTween!.evaluate(animation) as String,
      style: TextStyle(color: _colorTween!.evaluate(animation)),
    );
  }
}

class GhostFadeTween extends Tween<Color?> {
  final Color middle = Colors.white;

  GhostFadeTween({Color? begin, Color? end}) : super(begin: begin, end: end);

  @override
  Color? lerp(double t) {
    if (t <= 0.5) {
      return Color.lerp(begin, middle, t * 2);
    } else {
      return Color.lerp(middle, end, (t - 0.5) * 2);
    }
  }
}

class StringSwitchTween extends Tween<String?> {
  StringSwitchTween({String? begin, String? end})
      : super(begin: begin, end: end);

  @override
  String? lerp(double t) {
    if (t <= 0.5) {
      return begin;
    } else {
      return end;
    }
  }
}
