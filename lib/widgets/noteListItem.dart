import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:leCrypt_mobile/storage/notes_storage.dart';

class NoteItem extends StatefulWidget {
  final String title;
  final String note;
  final int index;

  NoteItem({
    this.title,
    this.note,
    this.index,
  });

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
            onTap: () {
              NoteStorage().DeletNote(widget.index);
              setState(() {});
            },
          ),
        ],
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.77,
                    child: TextField(
                      controller: titleController,
                      enabled: _enabled,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(_enabled ? Icons.check : Icons.edit),
                    onPressed: () {
                      setState(() {
                        _enabled = !_enabled;
                      });
                      if (!_enabled) {
                        NoteStorage().saveNote(titleController.text,
                            noteController.text, widget.index);
                      }
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
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
