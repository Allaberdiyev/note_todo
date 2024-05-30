import 'package:todo_note_project/models/note.dart';

class NoteController {
  final List<Note> _note = [];

  List<Note> get notes => _note;

  void addNote(int id, String title, String content) {
    _note.add(Note(
      id: id,
      title: title,
      content: content,
      createDate: DateTime.now(),
    ));
  }

  void editNote(int index, String title, String content) {
    _note[index].title = title;
    _note[index].content = content;
  }

  void removeNote(int index) {
    _note.removeAt(index);
  }
}
