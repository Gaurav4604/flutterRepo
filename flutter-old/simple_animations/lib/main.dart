import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  late Animation<double> animationDouble;
  late Animation<Color> animationColor;
  late Animation<double> animationCurves;
  late AnimationController animationControllerDouble;
  late AnimationController animationControllerColor;
  late AnimationController animationControllerCurves;

  @override
  void initState() {
    // vsync makes sure that animation is accessed only when the widget is on screen
    animationControllerDouble = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    animationControllerColor = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    animationControllerCurves = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    // tween animation takes initial and final values as parameters
    animationDouble =
        Tween<double>(begin: 0, end: 1).animate(animationControllerDouble);

    animationColor =
        ColorTween(begin: Colors.lightGreenAccent, end: Colors.blue)
            .animate(animationControllerColor) as Animation<Color>;

    // bezier curve animations
    animationCurves = CurvedAnimation(
        parent: animationControllerCurves, curve: Curves.bounceInOut);

    animationControllerDouble.forward();
    animationControllerColor.forward();
    animationControllerCurves.forward();

    animationDouble.addListener(() {
      setState(() {
        // print(animationDouble.value.toString());
      });
    });

    animationDouble.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationControllerDouble.reverse();
        animationControllerColor.reverse();
        animationControllerCurves.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationControllerDouble.forward();
        animationControllerColor.forward();
        animationControllerCurves.forward();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationControllerColor.dispose();
    animationControllerCurves.dispose();
    animationControllerDouble.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: animationColor.value,
              child: FlutterLogo(),
            ),
            LogoAnimation(animation: animationDouble),
            LogoAnimation2(animation: animationCurves)
          ],
        ),
      ),
    );
  }
}

class LogoAnimation extends AnimatedWidget {
  final Tween<double> _sizeAnim = Tween<double>(begin: 50, end: 100);

  LogoAnimation({Key? key, required Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Transform.rotate(
      angle: _sizeAnim.evaluate(animation),
      child: Opacity(
          opacity: animation.value,
          child: Container(
            height: _sizeAnim.evaluate(animation),
            width: 100,
            child: FlutterLogo(),
          )),
    );
  }
}

class LogoAnimation2 extends AnimatedWidget {
  final Tween<double> _sizeAnim = Tween<double>(begin: 50, end: 100);

  LogoAnimation2({Key? key, required Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Transform.scale(
      scale: animation.value,
      child: Opacity(
          opacity: animation.value,
          child: Container(
            height: _sizeAnim.evaluate(animation),
            width: 100,
            child: FlutterLogo(),
          )),
    );
  }
}
