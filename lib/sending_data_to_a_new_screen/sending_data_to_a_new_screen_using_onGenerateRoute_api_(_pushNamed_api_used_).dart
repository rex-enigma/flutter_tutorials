import 'package:flutter/material.dart';

//this class contains todo data
class TodoA {
  final String title;
  final String description;

  TodoA({required this.title, required this.description});
}

class TodosScreenD extends StatelessWidget {
  static const routeName = '/TodosScreenD';
  final todos = List.generate(
      20,
      (i) => TodoA(
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
              Navigator.pushNamed(
                context,
                DetailTodoScreenB.routeName,
                arguments: todos[index],
              );
            },
          );
        },
      ),
    );
  }
}

class DetailTodoScreenB extends StatelessWidget {
  static const routeName = '/detailTodoScreen';
  String title;
  String description;

  DetailTodoScreenB({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(description),
      ),
    );
  }
}
