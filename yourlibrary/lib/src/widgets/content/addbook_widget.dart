import 'package:flutter/material.dart';

class AddbookWidget extends StatefulWidget {
  AddbookWidget({Key? key}) : super(key: key);

  @override
  _AddbookWidgetState createState() => _AddbookWidgetState();
}

class _AddbookWidgetState extends State<AddbookWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Agregar Libro')),
    );
  }
}
