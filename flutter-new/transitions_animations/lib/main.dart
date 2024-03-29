import 'package:flutter/material.dart';
import 'package:transitions_animations/animated_container_screen.dart';
import 'package:transitions_animations/custom_animated_widget.dart';
import 'package:transitions_animations/doppler_based_color_animation.dart';
import 'package:transitions_animations/galaxy_spin.dart';
import 'package:transitions_animations/headline.dart';
import 'package:transitions_animations/hero_animation_screen.dart';
import 'package:transitions_animations/page_route_transition_screen.dart';
import 'package:transitions_animations/radial_animation_screen.dart';
import 'package:transitions_animations/stagger_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool expand = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Headline(text: "Base Animation", index: index),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              curve: Curves.easeInOutCubic,
              duration: const Duration(milliseconds: 100),
              width: expand ? 200 : 100,
              height: 100,
              decoration: const BoxDecoration(color: Colors.amber),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DopplerColorFilterAnimation(),
                  ));
                },
                child: const Text("Go To Doppler")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const GalaxySpin(),
                  ));
                },
                child: const Text("Go To Spinning Galaxy")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LightRayTransition(),
                  ));
                },
                child: const Text("Go To Light Ray")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AnimatedContainerScreen(),
                  ));
                },
                child: const Text("Go To Animated Container Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HeroAnimationScreen(),
                  ));
                },
                child: const Text("Go To Hero Transition Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RadialAnimationScreen(),
                  ));
                },
                child: const Text("Go To Radial Hero Transition Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PageRouteTransitionScreen(),
                  ));
                },
                child: const Text("Go To Page Transition Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const StaggerScreen(),
                  ));
                },
                child: const Text("Go To Stagger Transition Screen")),
            IconButton(
                onPressed: () => setState(() {
                      index = index == 0 ? 1 : 0;
                    }),
                icon: const Icon(Icons.abc))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            expand = !expand;
          });
        },
        shape: expand
            ? const CircleBorder(side: BorderSide(width: 10))
            : const CircleBorder(side: BorderSide(width: 0)),
        tooltip: 'Expand/Collapse',
        child: Icon(expand ? Icons.unfold_less_rounded : Icons.expand),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
