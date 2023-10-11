import 'package:flutter/material.dart';
import 'package:test_app/lists_and_grid_screen.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({
    super.key,
  });

  Column _buildButtonSection(Color color, IconData icon, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 10),
        ),
        Text(
          text,
          style: TextStyle(color: color),
        )
      ],
    );
  }

  final Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  final Widget titleRow = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Oeschinen Lake Campground",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
            ),
            const Text(
              "Kandersteg, Switzerland",
              style: TextStyle(color: Color.fromRGBO(100, 100, 100, 1)),
            ),
          ],
        )),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.orange[900],
            ),
            const Text("41")
          ],
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    Widget buttonSection = Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButtonSection(
              Theme.of(context).primaryColor, Icons.call, "CALL"),
          _buildButtonSection(
              Theme.of(context).primaryColor, Icons.near_me, "LOCATION"),
          _buildButtonSection(
              Theme.of(context).primaryColor, Icons.share, "SHARE"),
        ],
      ),
    );

    return Scaffold(
      body: ListView(
        children: [
          Image.asset("images/lake.jpg", fit: BoxFit.fill),
          titleRow,
          buttonSection,
          textSection,
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListsAndGridScreen()));
              },
              child: const Text("Go to lists and Grid"))
        ],
      ),
    );
  }
}
