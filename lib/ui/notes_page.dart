import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/storage/notes_storage.dart';
import 'package:leCrypt_mobile/widgets/customSearchBar.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        CustomSearchBar(
          hint: 'Search',
          onTap: () {},
        ),
        SizedBox(
          height: 20,
        ),
        StreamBuilder(
          stream: NoteStorage().getNotes().asStream(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data.length > 0) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].note),
                  );
                },
              );
            } else {
              return Center(
                child: Text('No note found!'),
              );
            }
          },
        ),
      ],
    );
  }
}
