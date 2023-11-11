import 'package:flutter/material.dart';
import 'package:scroll/parallax_scroll.dart';
import 'package:scroll/sliver_list_custom.dart';
import 'package:scroll/sliver_list_with_appbar.dart';

void main() {
  runApp(const HorizonsApp());
}

class HorizonsApp extends StatelessWidget {
  const HorizonsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // This is the theme of your application.
      theme: ThemeData.dark(),
      // Scrolling in Flutter behaves differently depending on the
      // ScrollBehavior. By default, ScrollBehavior changes depending
      // on the current platform. For the purposes of this scrolling
      // workshop, we're using a custom ScrollBehavior so that the
      // experience is the same for everyone - regardless of the
      // platform they are using.
      scrollBehavior: const ConstantScrollBehavior(),
      title: 'Horizons Weather',
      routes: {
        "/home": (context) => HomeScreen(),
        "/sliver-list-with-appBar": (context) => const SliverListWithAppBar(),
        "/sliver-list-custom": (context) => const CustomSliverList(),
        "/parallax-scroll": (context) => const ParallaxScroll()
      },
      initialRoute: "/home",
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final routeList = [
    "sliver-list-with-appBar",
    "sliver-list-custom",
    "parallax-scroll"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: routeList.length,
          itemBuilder: (context, index) {
            return TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/${routeList[index]}");
                },
                child: Text(routeList[index]));
          }),
    );
  }
}
