import 'package:flutter/material.dart';
import 'package:simple_notes/create_update.dart';
import 'package:simple_notes/databaseControl.dart';
import 'package:simple_notes/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];
  bool isLoaded = false;
  DatabaseHandler db = new DatabaseHandler();
  @override
  void initState() {
    retrieve();
    super.initState();
  }

  void retrieve() async {
    notes = await db.retrieveNote();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: isLoaded
          ? SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        onDismissed: (DismissDirection direction) async {
                          await db.deleteNote(notes[index].id);
                          setState(() {
                            isLoaded = false;
                          });
                          retrieve();
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(Icons.delete_forever),
                        ),
                        key: ValueKey<int>(notes[index].id),
                        child: Card(
                          child: ListTile(
                            onTap: () async {
                              bool result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ViewNote(note: notes[index])));
                              if (result) {
                                setState(() {
                                  isLoaded = false;
                                });
                                retrieve();
                              }
                            },
                            contentPadding: EdgeInsets.all(8.0),
                            title: Text(notes[index].title),
                            subtitle: Text(notes[index].body.length >= 50
                                ? notes[index].body.substring(0, 50) + "..."
                                : notes[index].body),
                          ),
                        ),
                      );
                    }),
              ),
            )
          : Text("loading..."),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue,
        ),
        child: IconButton(
            color: Colors.white,
            onPressed: () async {
              bool result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreatePage(
                            is_update: false,
                            note: Note(title: "", body: ""),
                          )));
              print(result);
              if (result) {
                setState(() {
                  isLoaded = false;
                });
                retrieve();
              }
            },
            icon: Icon(Icons.add)),
      ),
    );
  }
}
