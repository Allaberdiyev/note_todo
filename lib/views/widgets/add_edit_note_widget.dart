import 'package:flutter/material.dart';

class NoteAddEditDialog extends StatefulWidget {
  final String? initialTitle;
  final String? initialContent;
  final bool isEditing;

  const NoteAddEditDialog({
    Key? key,
    this.initialTitle,
    this.initialContent,
    required this.isEditing,
  }) : super(key: key);

  @override
  _NoteAddEditDialogState createState() => _NoteAddEditDialogState();
}

class _NoteAddEditDialogState extends State<NoteAddEditDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      _titleController.text = widget.initialTitle ?? '';
      _contentController.text = widget.initialContent ?? '';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 214, 214, 214),
      title: Text(
        widget.isEditing ? 'Edit note' : 'Add note',
        style: TextStyle(color: Color.fromARGB(255, 36, 7, 255), fontSize: 18),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _contentController,
            decoration: const InputDecoration(labelText: 'Content'),
          ),
        ],
      ),
      actions: [
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
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop({
              'title': _titleController.text,
              'content': _contentController.text,
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
