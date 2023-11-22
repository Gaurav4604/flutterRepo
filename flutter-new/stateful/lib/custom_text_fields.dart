import 'package:flutter/material.dart';

class CustomTextFieldsScreen extends StatefulWidget {
  const CustomTextFieldsScreen({super.key});

  @override
  State<CustomTextFieldsScreen> createState() => _CustomTextFieldsScreenState();
}

class _CustomTextFieldsScreenState extends State<CustomTextFieldsScreen> {
  final textControllerA = TextEditingController();
  final textControllerB = TextEditingController();

  @override
  void initState() {
    super.initState();

    textControllerB.addListener(() {
      String text = textControllerB.text;
      print(text);
    });
  }

  @override
  void dispose() {
    textControllerA.dispose();
    textControllerB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Textfield"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textControllerA,
          ),
          TextField(
            controller: textControllerB,
            // onChanged: (value) => print(value),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(textControllerA.text),
            duration: const Duration(milliseconds: 500),
          ));
        },
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
