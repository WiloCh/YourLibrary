// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book({
    this.name,
    this.autor,
    this.generos,
    this.numeroPaginas,
  });

  String? name;
  String? autor;
  String? generos;
  String? numeroPaginas;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        name: json["name"],
        autor: json["autor"],
        generos: json["Generos"],
        numeroPaginas: json["NumeroPaginas"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "autor": autor,
        "Generos": generos,
        "NumeroPaginas": numeroPaginas,
      };
}
