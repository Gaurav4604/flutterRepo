import 'package:flutter/material.dart';

class NotePreview extends StatelessWidget {
  const NotePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
