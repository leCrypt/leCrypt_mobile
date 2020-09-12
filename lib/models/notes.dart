import 'dart:convert';

Notes notesFromJson(String str) => Notes.fromJson(json.decode(str));

String notesToJson(Notes data) => json.encode(data.toJson());

class Notes {
  Notes({
    this.notes,
  });

  List<Note> notes;

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        notes: List<Note>.from(json['notes'].map((x) => Note.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'notes': List<dynamic>.from(notes.map((x) => x.toJson())),
      };
}

class Note {
  Note({
    this.note,
    this.title,
  });

  String note;
  String title;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        note: json['note'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'note': note,
        'title': title,
      };
}
