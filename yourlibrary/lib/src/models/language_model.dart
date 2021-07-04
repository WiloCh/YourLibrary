// To parse this JSON data, do
//
//     final language = languageFromJson(jsonString);

import 'dart:convert';

Language languageFromJson(String str) => Language.fromJson(json.decode(str));

String languageToJson(Language data) => json.encode(data.toJson());

class Language {
  Language({
    this.name,
    this.origin,
  });

  String? name;
  String? origin;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
        origin: json["origin"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "origin": origin,
      };
}
