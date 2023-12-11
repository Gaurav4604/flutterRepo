import 'package:flutter/material.dart';

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
        length: 3,
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
                  onPressed: () {}, child: const Text("Routing!"))),
        ],
      ),
    );
  }
}
