import 'package:flutter/material.dart';

//this class contains todo data
class Todo {
  final String title;
  final String description;

  Todo({required this.title, required this.description});
}

class TodosScreenB extends StatelessWidget {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailTodoScreen(),
                  //pass the arguments as part of the RouteSettings. The
                  //DetailScreen reads the arguments from these settings.
                  settings: RouteSettings(
                    arguments: todos[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Extract arguments from the current ModalRoute
    //settings 'property' and cast then as Todo
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

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
