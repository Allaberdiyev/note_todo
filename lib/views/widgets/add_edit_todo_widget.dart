import 'package:flutter/material.dart';

class TodoAddEditDialog extends StatelessWidget {
  final String? initialTitle;
  final String? initialDescription;
  final bool isEditing;

  const TodoAddEditDialog({
    this.initialTitle,
    this.initialDescription,
    required this.isEditing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: initialTitle);
    final TextEditingController descriptionController =
        TextEditingController(text: initialDescription);

    return AlertDialog(
      title: Text(
        isEditing ? 'Edit note' : 'Add note',
        style: TextStyle(color: Color.fromARGB(255, 36, 7, 255), fontSize: 18),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Plan name'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'Plan description'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop({
              'title': titleController.text,
              'description': descriptionController.text
            });
          },
          child: const Text(
            'Save',
            style: TextStyle(
              color: Color.fromARGB(255, 36, 7, 255),
            ),
          ),
        ),
      ],
    );
  }
}
