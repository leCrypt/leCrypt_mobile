import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/provider/app_provider.dart';
import 'package:provider/provider.dart';

class SearchList {
  void searchNoteList(String value, BuildContext context) {
    print(value);
    final provider = Provider.of<AppProvider>(context, listen: false);
    provider.setSearchNoteList([]);
    provider.setIsSearchingList(true);
    for (var note in provider.noteList) {
      if (note.title.toLowerCase().contains(value.toLowerCase())) {
        provider.addToSearchNoteList(note);
      }
    }
  }

  void searchPassList(String value, BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);
    provider.setSearchPassList([]);
    provider.setIsSearchingList(true);
    for (var pass in provider.passwordList) {
      if (pass.website.toLowerCase().contains(value.toLowerCase())) {
        provider.addToSearchPassList(pass);
      }
    }
  }
}
