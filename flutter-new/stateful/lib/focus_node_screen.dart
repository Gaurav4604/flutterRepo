import 'package:flutter/material.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Focus Traversal"),
      ),
      body: Column(
        children: [
          const FocusColumn(),
          const FocusColumn(),
          FocusTraversalGroup(
            policy: OrderedTraversalPolicy(),
            child: Row(
              children: <Widget>[
                const Spacer(),
                FocusTraversalOrder(
                  order: const NumericFocusOrder(2),
                  child: TextButton(
                    child: const Text('ONE'),
                    onPressed: () {},
                  ),
                ),
                const Spacer(),
                FocusTraversalOrder(
                  order: const NumericFocusOrder(1),
                  child: TextButton(
                    child: const Text('TWO'),
                    onPressed: () {},
                  ),
                ),
                const Spacer(),
                FocusTraversalOrder(
                  order: const NumericFocusOrder(3),
                  child: TextButton(
                    child: const Text('THREE'),
                    onPressed: () {},
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FocusColumn extends StatefulWidget {
  const FocusColumn({super.key});

  @override
  State<FocusColumn> createState() => _FocusColumnState();
}

class _FocusColumnState extends State<FocusColumn> {
  String _label = "unFocused";
  Color _color = Colors.black12;

  @override
  Widget build(BuildContext context) {
    return Focus(
        onFocusChange: (focus) {
          setState(() {
            _label = focus ? "Focused" : "unFocused";
            _color = focus ? Colors.amberAccent : Colors.black12;
          });
        },
        child: Container(
          width: 300,
          height: 50,
          alignment: Alignment.center,
          color: _color,
          child: Text(_label),
        ));
  }
}
