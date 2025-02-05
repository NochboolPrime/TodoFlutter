import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import 'package:uuid/uuid.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _titleController = TextEditingController();
  final _textController = TextEditingController();

  void _addTodo() {
    final title = _titleController.text;
    final text = _textController.text;
    if (title.isEmpty || text.isEmpty) {
      return;
    }

    final newTodo = Todo(
      id: Uuid().v4(),
      title: title,
      text: text,
    );

    Provider.of<List<Todo>>(context, listen: false).add(newTodo);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Добавить Туду')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Заголовок'),
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Текст'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Добавить'),
              onPressed: _addTodo,
            ),
          ],
        ),
      ),
    );
  }
}
