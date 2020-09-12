import 'package:flutter/material.dart';
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
      ],
    );
  }
}
