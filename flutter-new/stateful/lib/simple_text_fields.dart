import 'package:flutter/material.dart';

class SimpleTextFieldsScreen extends StatelessWidget {
  const SimpleTextFieldsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Textfield"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: AutofillHints.name,
                  hintMaxLines: 2),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: "Username"),
            ),
          )
        ],
      ),
    );
  }
}
