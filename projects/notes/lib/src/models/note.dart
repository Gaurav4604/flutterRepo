import 'package:flutter/material.dart';

class Note {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? category;
  final Color? color;
  final bool isPinned;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.updatedAt,
    this.category,
    this.color,
    this.isPinned = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'category': category,
      'color': color?.value,
      'isPinned': isPinned ? 1 : 0,
    };
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      category: map['category'],
      color: map['color'] != null ? Color(map['color']) : null,
      isPinned: map['isPinned'] == 1,
    );
  }
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
