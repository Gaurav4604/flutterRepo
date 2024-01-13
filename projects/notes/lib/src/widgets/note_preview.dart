import 'package:flutter/material.dart';

class NotePreview extends StatelessWidget {
  final String title;
  const NotePreview({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          // border: ,
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
