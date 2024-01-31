import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'note.dart'; // Replace with the correct path to your Note class

class NotesManager extends ChangeNotifier {
  List<Note> _notes = [];
  Database? _database;

  Future<void> initializeDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'notes_database.db');

    _database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE notes(
          id TEXT PRIMARY KEY, 
          title TEXT NOT NULL, 
          content TEXT NOT NULL,
          createdAt TEXT NOT NULL,
          updatedAt TEXT,
          category TEXT,
          color INTEGER,
          isPinned INTEGER
        )
      ''');
    });
  }

  Future<void> loadNotesFromDB() async {
    if (_database == null) {
      return;
    }
    final List<Map<String, dynamic>> maps = await _database!.query('notes');
    _notes = maps.map((map) => Note.fromMap(map)).toList();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    if (_database != null) {
      await _database!.insert('notes', note.toMap());
      _notes.add(note);
      notifyListeners();
    } else {
      return;
    }
  }

  Future<void> updateNote(String noteId, Note updatedNote) async {
    await _database!.update(
      'notes',
      updatedNote.toMap(),
      where: 'id = ?',
      whereArgs: [noteId],
    );
    final index = _notes.indexWhere((note) => note.id == noteId);
    if (index != -1) {
      _notes[index] = updatedNote;
      notifyListeners();
    }
  }

  Future<void> deleteNote(String noteId) async {
    await _database!.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [noteId],
    );
    _notes.removeWhere((note) => note.id == noteId);
    notifyListeners();
  }

  List<Note> get notes => _notes;

  Note? getNoteById(String noteId) {
    return _notes.firstWhereOrNull((note) => note.id == noteId);
  }

  Set<String> get categories {
    return _notes.map((note) => note.category).whereType<String>().toSet();
  }
}
