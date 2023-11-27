import 'package:flutter/material.dart';
import 'package:stateful/custom_dismissible.dart';
import 'package:stateful/custom_text_fields.dart';
import 'package:stateful/drag_drop_gestures.dart';
import 'package:stateful/focus_based_text_fields.dart';
import 'package:stateful/focus_node_screen.dart';
import 'package:stateful/inkwell_based_button.dart';
import 'package:stateful/select_copy_text_text_field.dart';
import 'package:stateful/simple_gestures.dart';
import 'package:stateful/simple_stateful_layout.dart';
import 'package:stateful/simple_text_fields.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Home(),
        "/stateful_layout": (context) => LayoutScreen(),
        "/gesture_basic_with_snackbar": (context) => const SimpleGestures(),
        "/gesture_drag_drop": (context) => const DragDrop(),
        "/inkwell_flat_button": (context) => const InkWellScreen(),
        "/custom_dismissibles": (context) => const CustomDismissibleScreen(),
        "/simple_textfield": (context) => const SimpleTextFieldsScreen(),
        "/custom_textfield": (context) => const CustomTextFieldsScreen(),
        "/focus_textfield": (context) => const FocusBasedTextFieldScreen(),
        "/select_copy_textfield": (context) => const SelectCopyTextFields(),
        "/focus_screen": (context) => const FocusScreen(),
      },
      initialRoute: "/",
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final List<String> routes = [
    "stateful_layout",
    "gesture_basic_with_snackbar",
    "gesture_drag_drop",
    "inkwell_flat_button",
    "custom_dismissibles",
    "simple_textfield",
    "custom_textfield",
    "focus_textfield",
    "select_copy_textfield",
    "focus_screen"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverList.builder(
              itemCount: routes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(routes[index]),
                  onTap: () =>
                      Navigator.pushNamed(context, "/${routes[index]}"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
