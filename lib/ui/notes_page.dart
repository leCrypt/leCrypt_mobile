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
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return FutureBuilder(
      future: NoteStorage().getNotes(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          provider.setNoteList(snapshot.data);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: provider.noteList.length,
            itemBuilder: (context, index) {
              return NoteItem(
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
      },
    );
  }
}

// final provider = Provider.of<AppProvider>(context);
//     if (provider.noteList != null) {
//       return ListView.builder(
//         shrinkWrap: true,
//         itemCount: provider.noteList.length,
//         itemBuilder: (context, index) {
//           return NoteItem(
//             title: provider.noteList[index].title,
//             note: provider.noteList[index].note,
//             index: index,
//           );
//         },
//       );
//     } else {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }
