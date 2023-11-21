import 'package:flutter/material.dart';

class CustomDismissibleScreen extends StatefulWidget {
  const CustomDismissibleScreen({super.key});

  @override
  State<CustomDismissibleScreen> createState() =>
      _CustomDismissibleScreenState();
}

class _CustomDismissibleScreenState extends State<CustomDismissibleScreen> {
  List<String> dismissibles = List.generate(100, (index) => '$index element');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Dismissibles"),
          ),
          SliverList.builder(
            itemCount: dismissibles.length,
            itemBuilder: (context, index) {
              return Dismissible(
                  key: GlobalKey(),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      dismissibles.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text(dismissibles[index]),
                  ));
            },
          )
        ],
      ),
    );
  }
}
