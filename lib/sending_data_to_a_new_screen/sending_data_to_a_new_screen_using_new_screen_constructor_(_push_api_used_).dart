import 'package:flutter/material.dart';

//this class contains todo data
class Todo {
  final String title;
  final String description;

  Todo({required this.title, required this.description});
}

class TodosScreenA extends StatelessWidget {
  final todos = List.generate(
      20,
      (i) => Todo(
          title: 'Todo $i', description: 'A description of what needs to be done for Todo $i'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('todo'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailTodoScreen(todo: todos[index])));
            },
          );
        },
      ),
    );
  }
}

class DetailTodoScreen extends StatelessWidget {
  DetailTodoScreen({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
