import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: MassiveList());
  }
}

class MassiveList extends StatelessWidget {
  MassiveList({super.key});

  final items = List.generate(1000, (index) => 'item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return FancyContainer(content: items[index]);
        },
        itemCount: items.length,
        prototypeItem: FancyContainer(content: items.first),
      ),
    );
  }
}

class FancyContainer extends StatelessWidget {
  final String content;
  const FancyContainer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: Color(Random().nextInt(0xffffffff)).withAlpha(0xff)),
      alignment: Alignment.center,
      width: double.infinity,
      child: Text(content),
    );
  }
}
