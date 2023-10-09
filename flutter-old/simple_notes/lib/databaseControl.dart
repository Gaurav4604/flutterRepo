import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'simple_notes.db'),
      onCreate: (database, version) async {
        await database.execute(
            "create table notes(id integer primary key autoincrement, title text not null, body text not null)");
      },
      version: 1,
    );
  }

  Future<int> insertNote(Note note) async {
    final Database db = await initializeDB();
    int result = await db.insert('notes', note.toMap());
    print(result);
    return result;
  }

  Future<int> updateNote(Note note) async {
    final Database db = await initializeDB();
    int result = await db
        .update('notes', note.toMap(), where: "id=?", whereArgs: [note.id]);
    print(result);
    return result;
  }

  Future<List<Note>> retrieveNote() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryNotes = await db.query('notes');
    List<Note> returnList = queryNotes.map((e) => Note.fromMap(e)).toList();
    for (int i = 0; i < returnList.length; i++) {
      print(returnList[i].id);
      print(returnList[i].title);
      print(returnList[i].body);
    }
    return returnList;
  }

  Future<void> deleteNote(int id) async {
    final Database db = await initializeDB();
    await db.delete('notes', where: "id=?", whereArgs: [id]);
  }
}

class Note {
  late String title, body;
  late int id;
  Note({
    required this.title,
    required this.body,
  });

  Note.fromMap(Map<String, dynamic> res)
      : title = res['title'],
        id = res['id'],
        body = res['body'];

  Map<String, Object?> toMap() {
    return {'title': title, 'body': body};
  }
}
