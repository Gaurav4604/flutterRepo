import 'package:flutter/material.dart';

class CRTCollapseAnimation extends ImplicitlyAnimatedWidget {
  final Widget child;
  final double height; // Height to animate to and from

  const CRTCollapseAnimation({
    Key? key,
    required this.child,
    this.height = 1.0, // Default to a line
    Duration duration = const Duration(milliseconds: 300),
  }) : super(key: key, duration: duration);

  @override
  AnimatedWidgetBaseState<CRTCollapseAnimation> createState() =>
      _CRTCollapseAnimationState();
}

class _CRTCollapseAnimationState
    extends AnimatedWidgetBaseState<CRTCollapseAnimation> {
  Tween<double>? _heightTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _heightTween = visitor(
      _heightTween,
      widget.height,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.center,
        heightFactor: _heightTween?.evaluate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: widget.child,
      ),
    );
  }
}
