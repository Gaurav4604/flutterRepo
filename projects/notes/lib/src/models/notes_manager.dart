import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:notes/src/models/note.dart';

class NotesManager extends ChangeNotifier {
  // Assuming you have a list to store notes in memory
  // In a real app, this could interface with a database
  final List<Note> _notes = [];

  // Create a new note
  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  // Retrieve all notes
  List<Note> get notes => _notes;

  // Update a note
  void updateNote(String noteId, Note updatedNote) {
    final index = _notes.indexWhere((note) => note.id == noteId);
    if (index != -1) {
      _notes[index] = updatedNote;
      notifyListeners();
    }
  }

  // Delete a note
  void deleteNote(String noteId) {
    _notes.removeWhere((note) => note.id == noteId);
    notifyListeners();
  }

  Set<String> get categories {
    return _notes.map((note) => note.category).whereType<String>().toSet();
  }

  // Find a single note by ID
  Note? getNoteById(String noteId) {
    return _notes.firstWhereOrNull((note) => note.id == noteId);
  }
  // Additional methods as needed...
}
