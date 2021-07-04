import 'package:flutter/material.dart';

class ReadbookWidget extends StatefulWidget {
  ReadbookWidget({Key? key}) : super(key: key);

  @override
  _ReadbookWidgetState createState() => _ReadbookWidgetState();
}

class _ReadbookWidgetState extends State<ReadbookWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Libros Leidos'),
    );
  }
}
