import 'package:flutter/material.dart';

class Note {
  final String id; // Unique identifier for the note
  final String title; // Title of the note
  String content; // Content of the note
  DateTime createdAt; // Date and time the note was created
  DateTime? updatedAt; // Date and time the note was last updated (nullable)
  String? category; // Optional category or tag for the note
  Color? color; // Optional color for the note (for UI purposes)
  bool isPinned; // Whether the note is pinned or not

  Note({
    required this.id,
    required this.title,
    required this.content,
    DateTime? createdAt,
    this.updatedAt,
    this.category,
    this.color,
    this.isPinned = false,
  }) : createdAt = createdAt ?? DateTime.now();

  // You can add methods like copyWith, toJson, fromJson, etc., for more functionality.
}

List<Note> generateSampleNotes(int count) {
  List<Note> notes = [];
  for (int i = 1; i <= count; i++) {
    notes.add(Note(
      id: 'id_$i',
      title: 'This is the Note Title $i',
      content: 'This is the content of note $i.',
      createdAt: DateTime.now().subtract(Duration(days: i)),
      updatedAt:
          i % 2 == 0 ? DateTime.now().subtract(Duration(days: i - 1)) : null,
      category: i % 3 == 0 ? 'Category ${i ~/ 3}' : null,
      color: i % 4 == 0 ? Colors.primaries[i % Colors.primaries.length] : null,
      isPinned: i % 5 == 0,
    ));
  }
  return notes;
}
