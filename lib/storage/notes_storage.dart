import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:leCrypt_mobile/models/notes.dart';
import 'package:leCrypt_mobile/provider/app_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class NoteStorage {
  Future<File> getNotesFile() async {
    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/notes.json');
    if (!(await file.exists())) {
      await file.create().then((value) {
        value.writeAsString(
          notesToJson(
            Notes(notes: []),
          ),
        );
      });
    }
    return file;
  }

  Future<List<Note>> getNotes() async {
    var file = await getNotesFile();
    var fileContent = await file.readAsString();
    var _notes = notesFromJson(fileContent);
    return _notes.notes;
  }

  Future<void> DeletNote(int index, BuildContext context) async {
    var notes = await getNotes();
    notes.removeAt(index);
    await writeNote(notes);
    Provider.of<AppProvider>(context, listen: false).deleteNote(index);
  }

  Future<void> writeNote(List<Note> notes) async {
    var file = await getNotesFile();
    await file.writeAsString(
      notesToJson(
        Notes(notes: notes),
      ),
    );
  }

  Future<void> saveNote(
      String title, String note, int index, BuildContext context) async {
    var notes = await getNotes();
    notes[index] = Note(title: title, note: note);
    await writeNote(notes);
  }

  Future<void> addNote(String title, String note, BuildContext context) async {
    var notes = await getNotes();
    notes.add(
      Note(
        note: (note),
        title: (title),
      ),
    );
    await writeNote(notes);
    Provider.of<AppProvider>(context, listen: false).addNote(
      Note(
        note: note,
        title: title,
      ),
    );
  }
}
