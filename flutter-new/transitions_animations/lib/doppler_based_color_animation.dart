import 'package:flutter/material.dart';

class DopplerColorFilterAnimation extends StatefulWidget {
  const DopplerColorFilterAnimation({super.key});

  @override
  State<DopplerColorFilterAnimation> createState() =>
      _DopplerColorFilterAnimationState();
}

class _DopplerColorFilterAnimationState
    extends State<DopplerColorFilterAnimation> {
  double _sliderValue = 0;
  Color? _newColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doppler Effect"),
      ),
      body: Center(
        child: Column(
          children: [
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 100),
              tween: ColorTween(begin: Colors.white, end: _newColor),
              child: Image.network(
                "https://picsum.photos/200/300",
                alignment: Alignment.center,
              ),
              builder: (_, color, child) {
                return ColorFiltered(
                  colorFilter:
                      ColorFilter.mode(color as Color, BlendMode.modulate),
                  child: child,
                );
              },
            ),
            Slider.adaptive(
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                    _newColor =
                        Color.lerp(Colors.white, Colors.red, _sliderValue);
                  });
                })
          ],
        ),
      ),
    );
  }
}
