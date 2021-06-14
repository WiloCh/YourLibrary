import 'package:flutter/material.dart';
import 'package:yourlibrary/src/widgets/cards/books_card.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            BooksCard(),
            BooksCard(),
            BooksCard(),
          ],
        ),
      ),
    );
  }
}
