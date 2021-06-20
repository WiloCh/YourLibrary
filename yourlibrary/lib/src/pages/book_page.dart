import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("images/b1.png", width: 250, height: 250),
            Text(
              "Call of Cthulhu",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              "H.P. Lovecraft",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              "SCI",
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      )),
    );
  }
}
