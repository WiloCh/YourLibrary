import 'package:flutter/material.dart';

class BooksCard extends StatelessWidget {
  const BooksCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Call of Cthulhu"),
        subtitle: Text("H.P. Lovecraft"),
      ),
    );
  }
}
