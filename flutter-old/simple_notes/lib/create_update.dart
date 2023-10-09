import 'package:flutter/material.dart';
import 'package:simple_notes/databaseControl.dart';

class CreatePage extends StatefulWidget {
  final bool is_update;
  final Note note;
  CreatePage({Key? key, required this.is_update, required this.note})
      : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController bodyController = new TextEditingController();

  @override
  void initState() {
    if (!widget.is_update) {
      titleController.text = "";
      bodyController.text = "";
    } else {
      titleController.text = widget.note.title;
      bodyController.text = widget.note.body;
    }
    super.initState();
  }

  Future<bool> back() async {
    Navigator.pop(context, false);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.is_update ? "Update" : "Create"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "body"),
              controller: bodyController,
            ),
            TextButton(
                onPressed: () async {
                  DatabaseHandler db = new DatabaseHandler();
                  if (widget.is_update) {
                    Note note = Note(
                        title: titleController.text.trim(),
                        body: bodyController.text.trim());
                    note.id = widget.note.id;
                    await db.updateNote(note);
                    Navigator.pop(context, note);
                  } else {
                    await db.insertNote(Note(
                        title: titleController.text.trim(),
                        body: bodyController.text.trim()));
                    Navigator.pop(context, true);
                  }
                },
                child: Text(widget.is_update ? "Update" : "Submit"))
          ],
        ),
      ),
    );
  }
}
