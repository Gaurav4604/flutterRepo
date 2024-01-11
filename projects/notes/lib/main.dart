import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
