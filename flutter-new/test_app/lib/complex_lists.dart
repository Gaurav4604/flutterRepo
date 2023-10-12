import 'package:flutter/material.dart';

abstract class ListItem {
  Widget buildTitle(BuildContext context);

  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}

class MessageItem implements ListItem {
  final String sender;
  final String message;

  MessageItem(this.sender, this.message);

  @override
  Widget buildSubtitle(BuildContext context) {
    return Text(
      message,
    );
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      sender,
    );
  }
}

class ComplexLists extends StatelessWidget {
  ComplexLists({super.key});

  final items = List<ListItem>.generate(
      100,
      (index) => index % 5 == 0
          ? HeadingItem("Heading $index")
          : MessageItem("Sender $index", "Message $index"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
