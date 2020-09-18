import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/models/notes.dart';

class AppProvider with ChangeNotifier {
  List<Note> _notesList;

  List<Note> get noteList => _notesList;

  void setNoteList(List<Note> notes) {
    _notesList = notes;
    notifyListeners();
  }
}
