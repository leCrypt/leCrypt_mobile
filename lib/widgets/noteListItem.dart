import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:leCrypt_mobile/models/notes.dart';
import 'package:leCrypt_mobile/storage/notes_storage.dart';
import 'package:leCrypt_mobile/values/values.dart';

class NoteItem extends StatefulWidget {
  final String title;
  final String note;
  final int index;

  NoteItem({
    Key key,
    this.title,
    this.note,
    this.index,
  }) : super(key: key);

  @override
  _NoteItemState createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  var titleController;
  var noteController;
  var _enabled = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    noteController = TextEditingController(text: widget.note);
  }

  void changeEnability() async {
    setState(() {
      _enabled = !_enabled;
    });
    if (!_enabled) {
      await NoteStorage().saveNote(
        Note(
          note: noteController.text.trim(),
          title: titleController.text.trim(),
        ),
        widget.index,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actions: [
          IconSlideAction(
            color: Colors.white,
            icon: Icons.delete,
            onTap: () async {
              await NoteStorage().DeletNote(widget.index, context);
            },
          ),
        ],
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: boxDecorationTextField,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.75,
                    child: TextField(
                      controller: titleController,
                      enabled: _enabled,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: inputDecorationTextField,
                    ),
                  ),
                  IconButton(
                    icon: Icon(_enabled ? Icons.check : Icons.edit),
                    onPressed: () async {
                      await changeEnability();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: noteController,
                enabled: _enabled,
                minLines: 1,
                maxLines: 7,
                keyboardType: TextInputType.multiline,
                decoration: inputDecorationTextField,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
