import 'package:flutter/material.dart';

class Todo {
  Todo({required this.title, required this.description});

  final String title;
  final String description;
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final todoList = List.generate(
      100,
      (index) => Todo(
          title: "title for todo: $index",
          description: "description for todo: $index"));

  Future<void> _navigateToTodoAndReturnResultOnPop(
      BuildContext context, Todo todo) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TodoDescriptionScreen(todo: todo)));
    if (!mounted) {
      return;
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("$result")));
    }
  }

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
                  _navigateToTodoAndReturnResultOnPop(context, todoList[index]);
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
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(todo.description),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "A message to say hi!");
              },
              child: const Text("message filled go back"))
        ],
      ),
    );
  }
}
