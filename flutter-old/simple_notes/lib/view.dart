import 'package:flutter/material.dart';
import 'package:simple_notes/create_update.dart';

import 'databaseControl.dart';

class ViewNote extends StatefulWidget {
  Note note;
  ViewNote({Key? key, required this.note}) : super(key: key);

  @override
  _ViewNoteState createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  Future<bool> back() async {
    Navigator.pop(context, true);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.note.title),
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.note.body),
              TextButton(
                  onPressed: () async {
                    Note note = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatePage(
                                is_update: true, note: widget.note)));
                    setState(() {
                      widget.note = note;
                    });
                  },
                  child: Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
