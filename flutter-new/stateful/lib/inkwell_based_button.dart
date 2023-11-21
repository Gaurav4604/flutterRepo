import 'package:flutter/material.dart';

class InkWellScreen extends StatelessWidget {
  const InkWellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inkwell Demo"),
      ),
      body: const Center(
        child: InkWellButton(),
      ),
    );
  }
}

class InkWellButton extends StatelessWidget {
  const InkWellButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Flat Button from InkWell"),
      ),
    );
  }
}
