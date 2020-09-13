import 'dart:io';

import 'package:leCrypt_mobile/models/notes.dart';
import 'package:path_provider/path_provider.dart';

import 'string_to_hash.dart';

class NoteStorage {
  Future<List<Note>> getNotes() async {
    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/notes.json');
    var fileContent = await file.readAsString();
    var _notes = notesFromJson(fileContent);
    return _notes.notes;
  }

  Future<void> DeletNote(int index) async {
    var notes = await getNotes();
    notes.removeAt(index);
    await writeNote(notes);
  }

  Future<void> writeNote(List<Note> notes) async {
    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/notes.json');
    var exist = await file.exists();
    if (!exist) {
      await file.create().then((value) {
        value.writeAsString(
          notesToJson(Notes(notes: notes)),
        );
      });
    } else {
      await file.writeAsString(
        notesToJson(Notes(notes: notes)),
      );
    }
  }

  Future<void> addNote(String title, String note) async {
    var notes = await getNotes();
    notes.add(
      Note(
        note: convertStringToHash(note),
        title: convertStringToHash(title),
      ),
    );
    await writeNote(notes);
  }
}
