import 'package:flutter/material.dart';
import 'package:routing/todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabs Navigation"),
        bottom: const TabBar(tabs: [
          Tab(
            icon: Icon(Icons.directions_bike),
          ),
          Tab(
            icon: Icon(Icons.directions_transit),
          ),
          Tab(
            icon: Icon(Icons.directions_car),
          ),
          Tab(
            icon: Icon(Icons.directions),
          ),
        ]),
      ),
      body: TabBarView(
        children: [
          const Center(child: Text("Bike!")),
          const Center(child: Text("Transit!")),
          const Center(child: Text("Car!")),
          Center(
              child: ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodoListScreen()),
                      ),
                  child: const Text("Routing!"))),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Hi There"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Pop!"))
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text("This is a Second Screen"),
      ),
    );
  }
}
