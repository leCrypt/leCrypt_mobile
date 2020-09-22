import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/provider/app_provider.dart';
import 'package:leCrypt_mobile/storage/notes_storage.dart';
import 'package:leCrypt_mobile/values/values.dart';
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
      final list = provider.isSearchingList
          ? provider.searchNoteList
          : provider.noteList;
      if (list.isNotEmpty) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return NoteItem(
              key: Key(list[index].title),
              index: index,
              note: list[index].note,
              title: list[index].title,
            );
          },
        );
      } else {
        return Center(
          child: Text('Nothing found!'),
        );
      }
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: purplePrimary,
        ),
      );
    }
  }
}
