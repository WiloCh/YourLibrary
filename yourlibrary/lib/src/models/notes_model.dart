// To parse this JSON data, do
//
//     final notes = notesFromJson(jsonString);

import 'dart:convert';

Notes notesFromJson(String str) => Notes.fromJson(json.decode(str));

String notesToJson(Notes data) => json.encode(data.toJson());

class Notes {
  Notes({
    this.id,
    required this.matter,
    required this.note,
  });

  int? id;
  String matter;
  String note;

  Notes.create(this.matter, this.note);

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        id: json["id"],
        matter: json["matter"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "matter": matter,
        "note": note,
      };
}
