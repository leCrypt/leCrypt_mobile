import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/provider/app_provider.dart';
import 'package:leCrypt_mobile/storage/notes_storage.dart';
import 'package:leCrypt_mobile/widgets/noteListItem.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  void didChangeDependencies() {
    setList(context);
    super.didChangeDependencies();
  }

  void setList(BuildContext context) async {
    final provider = Provider.of<AppProvider>(context);
    provider.setNoteList(await NoteStorage().getNotes());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    if (provider.noteList != null) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: provider.noteList.length,
        itemBuilder: (context, index) {
          return NoteItem(
            key: Key(provider.noteList[index].title),
            index: index,
            note: provider.noteList[index].note,
            title: provider.noteList[index].title,
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
