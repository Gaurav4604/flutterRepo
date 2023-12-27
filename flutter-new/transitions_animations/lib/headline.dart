import 'package:flutter/material.dart';

class Headline extends ImplicitlyAnimatedWidget {
  final String text;
  final int index;
  const Headline({Key? key, required this.text, required this.index})
      : super(
            key: key,
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn);

  Color get targetColor => index == 0 ? Colors.red : Colors.green;

  @override
  HeadlineState createState() => HeadlineState();
}

class HeadlineState extends ImplicitlyAnimatedWidgetState<Headline> {
  ColorTween? _colorTween;

  @override
  void initState() {
    animation.addStatusListener((status) => print(status));
    super.initState();
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _colorTween = visitor(_colorTween, widget.targetColor,
        (dynamic color) => ColorTween(begin: color)) as ColorTween;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.text} (${widget.index})',
      style: TextStyle(color: _colorTween?.evaluate(animation)),
    );
  }
}
