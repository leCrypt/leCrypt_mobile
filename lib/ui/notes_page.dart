import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/models/notes.dart';
import 'package:leCrypt_mobile/storage/notes_storage.dart';
import 'package:leCrypt_mobile/widgets/noteListItem.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> _notesList = List<Note>(0);

  @override
  void initState() {
    super.initState();
    NoteStorage().getNoteStream().listen((event) {
      setState(() {
        _notesList = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _notesList.length,
      itemBuilder: (context, index) {
        return NoteItem(
          title: _notesList[index].title,
          note: _notesList[index].note,
          index: index,
        );
      },
    );
  }
}
