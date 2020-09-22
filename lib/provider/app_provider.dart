import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/models/notes.dart';
import 'package:leCrypt_mobile/models/password.dart';

class AppProvider with ChangeNotifier {
  int _pageIndex = 0;
  List<Note> _notesList;
  List<Pass> _passwordList;
  List<Note> _searchNoteList;
  List<Pass> _searchPassList;

  int get pageIndex => _pageIndex;

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

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

  List<Note> get searchNoteList => _searchNoteList;

  void setSearchNoteList(List<Note> searchList) {
    _searchNoteList = searchList;
    notifyListeners();
  }

  void addToSearchNoteList(Note note) {
    _searchNoteList.add(note);
    notifyListeners();
  }

  List<Pass> get searchPassList => _searchPassList;

  void setSearchPassList(List<Pass> searchList) {
    _searchPassList = searchList;
    notifyListeners();
  }

  void addToSearchPassList(Pass pass) {
    _searchPassList.add(pass);
    notifyListeners();
  }
}
