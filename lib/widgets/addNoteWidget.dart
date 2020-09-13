import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/storage/notes_storage.dart';
import 'package:leCrypt_mobile/widgets/customTextField.dart';

import 'customFlatButton.dart';

void showAddNoteDialog(BuildContext context) {
  var titleController = TextEditingController();
  var noteController = TextEditingController();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text('Add Note'),
        actions: [
          CustomRaisedButton(
            title: 'Cancel',
            topPadding: 10,
            width: 80,
            fontSize: 16,
            offset: 4,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          CustomRaisedButton(
            title: 'Add',
            topPadding: 10,
            width: 80,
            fontSize: 16,
            offset: 4,
            onTap: () {
              NoteStorage().addNote(
                titleController.text,
                noteController.text,
              );
            },
          ),
        ],
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                hintText: 'Title',
                controller: titleController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Note',
                maxLines: 3,
                controller: noteController,
              ),
            ],
          ),
        ),
      );
    },
  );
}
