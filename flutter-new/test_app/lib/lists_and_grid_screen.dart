import 'package:flutter/material.dart';

class ListsAndGridScreen extends StatelessWidget {
  const ListsAndGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 300,
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text("Maps"),
                  ),
                  ListTile(
                    leading: Icon(Icons.abc),
                    title: Text("ABC"),
                  ),
                  ListTile(
                    leading: Icon(Icons.alarm),
                    title: Text("Alarms"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 160,
                    color: Colors.red,
                  ),
                  Container(
                    width: 160,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 160,
                    color: Colors.green,
                  ),
                  Container(
                    width: 160,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 160,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(100, (index) {
                  return Center(
                    child: Text(
                      'Item $index',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
