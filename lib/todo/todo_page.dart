import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todo_provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<TodoProvider>();

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'タスクを入力'),
          ),
          ElevatedButton(
            onPressed: () => provider.addTask(_controller.text),
            child: Text('追加')
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.taskList.length,
              itemBuilder: (context, index) {
                final task = provider.taskList[index];
                return ListTile(
                  title: Text(task.title),
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (_) => provider.toggleDone(index),),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => provider.removeTask(index),
                  )
                );
              }
            )
          ),],
        )
      );
  }
}