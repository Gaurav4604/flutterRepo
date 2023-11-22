import 'package:flutter/material.dart';

class FocusBasedTextFieldScreen extends StatefulWidget {
  const FocusBasedTextFieldScreen({super.key});

  @override
  State<FocusBasedTextFieldScreen> createState() =>
      _FocusBasedTextFieldScreenState();
}

class _FocusBasedTextFieldScreenState extends State<FocusBasedTextFieldScreen> {
  late FocusNode myFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Focus Based Text Fields"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                } else {
                  return null;
                }
              },
              focusNode: myFocusNode,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // if state is valid, make API call
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text("Processing Data"),
                  action: SnackBarAction(label: "Undo", onPressed: () {}),
                ));
              }
            },
            child: const Text("Submit"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myFocusNode.requestFocus();
        },
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
