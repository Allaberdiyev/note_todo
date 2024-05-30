import 'package:flutter/material.dart';
import 'package:todo_note_project/controllers/note_controller.dart';
import 'package:todo_note_project/views/widgets/add_edit_note_widget.dart';
import 'package:intl/intl.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final NoteController noteController = NoteController();

  void _addNote() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return const NoteAddEditDialog(
          isEditing: false,
        );
      },
    );

    if (result != null) {
      setState(() {
        noteController.addNote(
          id(noteController.notes.length + 1),
          result['title']!,
          result['content']!,
        );
      });
    }
  }

  void _editNote(int index) async {
    final initialTitle = noteController.notes[index].title;
    final initialContent = noteController.notes[index].content;

    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return NoteAddEditDialog(
          initialTitle: initialTitle,
          initialContent: initialContent,
          isEditing: true,
        );
      },
    );

    if (result != null) {
      setState(() {
        noteController.editNote(
          index,
          result['title']!,
          result['content']!,
        );
      });
    }
  }

  int id(int index) {
    return index++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 141, 34),
        title: const Text(
          "Notes Section",
          style: TextStyle(fontFamily: 'Lato'),
        ),
        actions: [
          TextButton(
            onPressed: _addNote,
            child: const Icon(
              Icons.add,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: noteController.notes.length,
        itemBuilder: (context, index) {
          final note = noteController.notes[index];
          final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              title: Text(note.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(note.content),
                  const SizedBox(height: 5),
                  Text(
                    dateFormat.format(note.createDate),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _editNote(index),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        noteController.removeNote(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
