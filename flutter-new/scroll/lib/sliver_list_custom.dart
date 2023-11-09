import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scroll/custom_sliver_component.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Company Names"),
            floating: true,
          ),
          const MyCustomSliver(child: Text("Hi there")),
          SliverPadding(
            padding: const EdgeInsets.only(left: 10),
            sliver: TheSliverList(),
          )
        ],
      ),
    );
  }
}

class TheSliverList extends StatelessWidget {
  TheSliverList({super.key});
  final companyNames = [
    "Ullrich - Rippin",
    "Langworth - Goyette",
    "Littel, Brown and Hudson",
    "Watsica - Kozey",
    "Bernier, Collins and Considine",
    "Bahringer - Beahan",
    "Mertz Inc",
    "Gleichner - Schmeler",
    "Sauer Inc",
    "Schinner Group",
    "Upton, Robel and Padberg",
    "Bauch and Sons",
    "Bahringer, Watsica and Kling",
    "Hyatt Group",
    "Grant - Gleason",
    "Simonis - Jast",
    "White - Jones",
    "Hayes - Koss",
    "Hoppe, Schmitt and Bruen",
    "McDermott, DuBuque and Jenkins",
    "Sauer Inc",
    "Schinner Group",
    "Upton, Robel and Padberg",
    "Bauch and Sons",
    "Bahringer, Watsica and Kling",
    "Hyatt Group",
    "Grant - Gleason",
    "Simonis - Jast",
    "White - Jones",
    "Hayes - Koss",
    "Hoppe, Schmitt and Bruen",
  ];

  Color _getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: companyNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 40,
              height: 40,
              color: _getRandomColor(),
            ),
            title: Text(companyNames[index]),
          );
        });
  }
}
