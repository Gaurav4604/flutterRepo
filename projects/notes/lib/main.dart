import 'package:flutter/material.dart';
import 'package:notes/src/animations/crt_animation.dart';
import 'package:notes/src/models/note.dart';
import 'package:notes/src/models/notes_manager.dart';
import 'package:notes/src/widgets/note_preview.dart';
import 'package:notes/src/widgets/scalable_fab.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => NotesManager(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF39FF14), // Neon Green
          onPrimary: Color(0xFF000000), // Black for elements on primary color
          secondary: Color(0xFF2EB515), // Dark Neon Green
          onSecondary:
              Color(0xFFFFFFFF), // White for elements on secondary color
          background: Color(0xFF000000), // Black
          onBackground: Color(0xFFFFFFFF), // White for text/icons on background
          surface: Color(0xFF121212), // Dark Grey
          onSurface: Color(0xFF8A8A8A), // Light Grey for elements on surface
          error: Colors.red, // Default error color
          onError: Color(0xFFFFFFFF), // White for elements on error color
          surfaceVariant: Color(0xFFA4FF70), // Light Neon Green
          onSurfaceVariant:
              Color(0xFF000000), // Black for elements on surface variant
          outline: Color(0xFF8A8A8A), // Light Grey for outlines
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isExpanded = true;
  final GlobalKey<SliverAnimatedGridState> listKey =
      GlobalKey<SliverAnimatedGridState>();

  @override
  void initState() {
    var sampleNotes = generateSampleNotes(10);
    sampleNotes.forEach((note) {
      final notesManager = Provider.of<NotesManager>(context);
      notesManager.addNote(note);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notesManager = Provider.of<NotesManager>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Home"),
            surfaceTintColor: Colors.transparent,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          // SliverAppBar(
          //   title: const Text("tool-bar"),
          //   surfaceTintColor: Colors.transparent,
          //   backgroundColor: Theme.of(context).colorScheme.background,
          //   floating: true,
          // ),
          SliverAnimatedGrid(
            key: listKey,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              mainAxisSpacing: 10, // Spacing between rows
              crossAxisSpacing: 10, // Spacing between columns
              childAspectRatio: 1, // Aspect ratio of the cards
            ),
            initialItemCount: notesManager.notes.length,
            itemBuilder: (context, index, animation) {
              return CRTAnimation(
                animation: CurvedAnimation(
                    parent: animation, curve: Curves.easeInOutExpo),
                child: NotePreview(
                  title: notesManager.notes.elementAt(index).title,
                ),
              );
            },
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              child: const Text("Remove Item"),
              onPressed: () {
                listKey.currentState?.removeItem(notesManager.notes.length - 1,
                    (
                  context,
                  animation,
                ) {
                  return CRTAnimation(
                      animation: CurvedAnimation(
                          parent: animation, curve: Curves.easeInOut),
                      child: NotePreview(
                        title: notesManager.notes
                            .elementAt(notesManager.notes.length - 1)
                            .title,
                      ));
                }, duration: const Duration(milliseconds: 400));
                Future.delayed(const Duration(milliseconds: 500), () {
                  notesManager.notes.removeAt(notesManager.notes.length - 1);
                });
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScalableFloatingActionButton(
        onPressed: () {
          listKey.currentState?.insertItem(notesManager.notes.length,
              duration: const Duration(milliseconds: 500));
          notesManager.notes
              .insert(notesManager.notes.length, generateSampleNotes(1)[0]);
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        scale: 1,
      ),
    );
  }
}
