import 'package:flutter/material.dart';
import 'package:notes/src/animations/crt_animation.dart';
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
      home: const HomePage(title: 'Home'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      body: Center(
        child: CRTCollapseAnimation(
          height: isExpanded ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: const NotePreview(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScalableFloatingActionButton(
          onPress: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          scale: 1),
    );
  }
}
