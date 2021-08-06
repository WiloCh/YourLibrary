import 'package:flutter/material.dart';
import 'package:yourlibrary/src/models/book_model.dart';
import 'package:yourlibrary/src/pages/book_page.dart';
import 'package:progress_indicator/progress_indicator.dart';

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
          subtitle: Column(
            children: [
              Container(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text((currentBook.author).toString()))),
              Text(''),
              BarProgress(
                  color: Theme.of(context).accentColor,
                  percentage:
                      ((double.parse(currentBook.pagRead.toString())) * 100.0) /
                          (double.parse(currentBook.pagNum.toString())))
            ],
          ),
          leading: currentBook.photo == null
              ? Image.asset('assets/images/LibroIcon.jpg')
              : Image.network(currentBook.photo.toString()),
        )));
  }
}
