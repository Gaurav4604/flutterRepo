import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: MediaQuery.of(context).platformBrightness);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: colorScheme,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
          buttonTheme: ButtonThemeData(
            buttonColor: colorScheme.primary,
          )),
      debugShowCheckedModeBanner: false,
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatelessWidget {
  final String title;
  const Home({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Hello There"),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.greenAccent)),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.note_alt_rounded),
        ),
      ),
    );
  }
}
