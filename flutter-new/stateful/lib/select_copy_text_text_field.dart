import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectCopyTextFields extends StatefulWidget {
  const SelectCopyTextFields({super.key});

  @override
  State<SelectCopyTextFields> createState() => _SelectCopyTextFieldsState();
}

class _SelectCopyTextFieldsState extends State<SelectCopyTextFields> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Copy TextField"),
      ),
      body: Actions(
        // dispatcher not specified (so default dispatcher will be used)
        actions: {
          CopyIntent: CopyAction(controller),
          SelectAllIntent: SelectAllAction(controller)
        },
        // dispatcher: LoggingActionDispatcher(),
        child: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
              ),
              IconButton(
                  onPressed: Actions.handler(context, const SelectAllIntent()),
                  icon: const Icon(Icons.select_all)),
              IconButton(
                  onPressed: Actions.handler(context, const CopyIntent()),
                  icon: const Icon(Icons.copy)),
            ],
          );
        }),
      ),
    );
  }
}

// first we need to define our intent
class CopyIntent extends Intent {
  const CopyIntent(); // simple constructor for class
}

// define the actual action
class CopyAction extends Action<CopyIntent> {
  CopyAction(this.controller);
  final TextEditingController controller;

  // actual method, that gets called, when the action needs to be executed
  @override
  Object? invoke(CopyIntent intent) {
    final String text = controller.text.substring(
      controller.selection.baseOffset,
      controller.selection.extentOffset,
    );
    // attach this data to clipboard API
    Clipboard.setData(ClipboardData(text: text));

    return null;
  }
}

class SelectAllIntent extends Intent {
  const SelectAllIntent();
}

class SelectAllAction extends Action<SelectAllIntent> {
  SelectAllAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(SelectAllIntent intent) {
    controller.selection = controller.selection.copyWith(
        affinity: controller.selection.affinity,
        baseOffset: 0,
        extentOffset: controller.selection.extentOffset);
    return null;
  }
}
