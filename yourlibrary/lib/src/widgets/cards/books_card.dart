import 'package:flutter/material.dart';
import 'package:yourlibrary/src/models/book_model.dart';
import 'package:yourlibrary/src/pages/book_page.dart';

class BooksCard extends StatelessWidget {
  const BooksCard({Key? key, required this.currentBook}) : super(key: key);
  final Book currentBook;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookPage(book: currentBook),
            ));
      },
      child: Card(
          child: ListTile(
        title: Text((currentBook.title).toString()),
        subtitle: Text((currentBook.author).toString()),
        leading: currentBook.photo == null
            ? Image.asset("assets/images/bu.png")
            : Image.network(currentBook.photo.toString()),
      )),
    );
  }
}
