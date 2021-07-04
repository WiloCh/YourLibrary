// To parse this JSON data, do
//
//     final author = authorFromJson(jsonString);

import 'dart:convert';

Author authorFromJson(String str) => Author.fromJson(json.decode(str));

String authorToJson(Author data) => json.encode(data.toJson());

class Author {
  Author({
    this.names,
    this.surnames,
    this.placeBorn,
    this.dateBorn,
  });

  String? names;
  String? surnames;
  String? placeBorn;
  String? dateBorn;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        names: json["names"],
        surnames: json["surnames"],
        placeBorn: json["place_born"],
        dateBorn: json["date_born"],
      );

  Map<String, dynamic> toJson() => {
        "names": names,
        "surnames": surnames,
        "place_born": placeBorn,
        "date_born": dateBorn,
      };
}
