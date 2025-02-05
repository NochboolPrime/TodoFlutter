import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../widgets/todo_item.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<List<Todo>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Туду-лист'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTodoScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoItem(todo: todos[index]);
        },
      ),
    );
  }
}
