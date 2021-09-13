// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book({
    this.title,
    this.author,
    this.editorial,
    this.pagNum,
    this.pagRead,
    this.description,
    this.photo,
    this.genre,
    this.iduser,
  });

  String? title;
  String? author;
  String? editorial;
  String? pagNum;
  String? pagRead;
  String? description;
  String? photo;
  String? genre;
  String? iduser;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        author: json["author"],
        editorial: json["editorial"],
        pagNum: json["pagNum"],
        pagRead: json["pagRead"],
        description: json["description"],
        photo: json["photo"],
        genre: json["genre"],
        iduser: json["iduser"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "editorial": editorial,
        "pagNum": pagNum,
        "pagRead": pagRead,
        "description": description,
        "photo": photo,
        "genre": genre,
        "iduser": iduser,
      };
}
