import 'package:flutter/material.dart';

class BooksCard extends StatelessWidget {
  const BooksCard({Key? key, required this.img}) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text("Call of Cthulhu"),
          subtitle: Text("H.P. Lovecraft"),
          leading: Image.asset("/images/" + img + ".png")),
    );
  }
}
