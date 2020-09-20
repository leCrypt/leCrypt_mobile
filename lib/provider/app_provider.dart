import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/models/notes.dart';

class AppProvider with ChangeNotifier {
  List<Note> _notesList;

  List<Note> get noteList => _notesList;

  void setNoteList(List<Note> notes) {
    _notesList = notes;
    notifyListeners();
  }

  void deleteNote(int index) {
    _notesList.removeAt(index);
    notifyListeners();
  }

  void addNote(Note note) {
    _notesList.add(note);
    notifyListeners();
  }
}
