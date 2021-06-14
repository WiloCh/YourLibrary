import 'package:flutter/material.dart';

class LibrariesWidget extends StatefulWidget {
  LibrariesWidget({Key? key}) : super(key: key);

  @override
  _LibrariesWidgetState createState() => _LibrariesWidgetState();
}

class _LibrariesWidgetState extends State<LibrariesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Librerias'),
      ),
    );
  }
}
