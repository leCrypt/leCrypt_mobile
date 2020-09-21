import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/models/notes.dart';
import 'package:leCrypt_mobile/models/password.dart';

class AppProvider with ChangeNotifier {
  List<Note> _notesList;
  List<Pass> _passwordList;

  List<Note> get noteList => _notesList;

  void setNoteList(List<Note> notes) {
    _notesList = notes;
    notifyListeners();
  }

  List<Pass> get passwordList => _passwordList;

  void setPasswordList(List<Pass> passes) {
    _passwordList = passes;
    notifyListeners();
  }
}
