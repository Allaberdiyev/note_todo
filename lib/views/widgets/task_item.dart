import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_note_project/models/todo.dart';

class TaskItem extends StatelessWidget {
  final Todo task;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  TaskItem({
    required this.task,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        title: Text(task.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.description),
            Text(
              dateFormat.format(task.date),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Color.fromARGB(255, 203, 14, 1),
              ),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
