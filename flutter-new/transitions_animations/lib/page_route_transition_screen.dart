import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/src/scheduler/ticker.dart';

class PageRouteTransitionScreen extends StatelessWidget {
  const PageRouteTransitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: DraggableRouteButton(),
        ));
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Page 2"),
      ),
    );
  }
}

class DraggableRouteButton extends StatefulWidget {
  const DraggableRouteButton({super.key});

  @override
  State<DraggableRouteButton> createState() => _DraggableRouteButtonState();
}

class _DraggableRouteButtonState extends State<DraggableRouteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // state for position to which the animation needs to animate to, after drag, via gesture
  Alignment _dragAlignment = Alignment.center;
  late Animation<Alignment> _animation;

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        // tells controller to stop actively resetting the value pf _dragAlignment
        // based on _animation.value
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          // manually sets the _dragAlignment value based on finger movement
          // the value is set relative to screen center
          // since the _controller is not listening to setState calls right now
          // direct _dragAlignment updates are changing button's position
          // based on the finger movement
          _dragAlignment += Alignment(details.delta.dx / (size.width / 2),
              details.delta.dy / (size.height / 2));
        });
      },
      onPanEnd: (d) {
        // now the _animation is set up again, with last known position of finger
        _runAnimation(d.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(_createRoute()),
            child: const Text("Go!")),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset.zero;

        const curve = Curves.fastOutSlowIn;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
