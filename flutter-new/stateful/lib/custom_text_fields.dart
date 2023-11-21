import 'package:flutter/material.dart';

class CustomTextFieldsScreen extends StatefulWidget {
  const CustomTextFieldsScreen({super.key});

  @override
  State<CustomTextFieldsScreen> createState() => _CustomTextFieldsScreenState();
}

class _CustomTextFieldsScreenState extends State<CustomTextFieldsScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
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
            controller: textController,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(textController.text),
            duration: const Duration(milliseconds: 500),
          ));
        },
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
