import 'package:flutter/material.dart';
import 'package:transitions_animations/custom_animated_widget.dart';
import 'package:transitions_animations/doppler_based_color_animation.dart';
import 'package:transitions_animations/galaxy_spin.dart';

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
      home: const HomePage(title: 'Base Animation'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                child: const Text("Go To Light Ray"))
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
