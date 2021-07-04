import 'package:flutter/material.dart';

class AddbookWidget extends StatefulWidget {
  const AddbookWidget({Key? key}) : super(key: key);

  @override
  _AddbookWidgetState createState() => _AddbookWidgetState();
}

class _AddbookWidgetState extends State<AddbookWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(" "),
            Text(" "),
            Text(
              "Título: ",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Autor: ",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Editorial: ",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Número de Páginas: ",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Número de Páginas Leidas: ",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Descripción: ",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Foto:",
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
