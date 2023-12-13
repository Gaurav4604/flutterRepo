import 'package:flutter/material.dart';

class Todo {
  Todo({required this.title, required this.description});

  final String title;
  final String description;
}

class TodoListScreen extends StatelessWidget {
  TodoListScreen({super.key});

  final todoList = List.generate(
      100,
      (index) => Todo(
          title: "title for todo: $index",
          description: "description for todo: $index"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todoList[index].title),
                subtitle: Text(todoList[index].description),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return TodoDescriptionScreen(todo: todoList[index]);
                    },
                  ));
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class TodoDescriptionScreen extends StatelessWidget {
  const TodoDescriptionScreen({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(todo.description),
      ),
    );
  }
}
