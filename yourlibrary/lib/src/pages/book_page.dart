import 'package:flutter/material.dart';
import 'package:yourlibrary/src/models/book_model.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(" "),
            Text(" "),
            Text(
              widget.book.title.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
            Container(
                child: widget.book.photo == null
                    ? Image.asset("assets/images/bu.png")
                    : Image.network(widget.book.photo.toString(), width: 200)),
            Text(" "),
            Text(" "),
            Text(
              "Autor: " + widget.book.author.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Editorial: " + widget.book.editorial.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Descripción: " + widget.book.description.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Páginas Leidas: " +
                  widget.book.pagRead.toString() +
                  "/" +
                  widget.book.pagNum.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
