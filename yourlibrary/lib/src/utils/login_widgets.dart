import 'package:flutter/material.dart';

class BtnStyle extends StatelessWidget {
  final Color color1;
  final Color color2;
  final text;
  final Widget pressed;
  final Color colortext;

  BtnStyle(
      {required this.color1,
      required this.color2,
      required this.text,
      required this.pressed,
      required this.colortext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pressed,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          padding: EdgeInsets.all(0.0),
        ),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: colortext),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginBackground extends StatelessWidget {
  final text;
  LoginBackground(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffF5591F), Color(0xffF2861E)],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 30),
              )),
          Center(
            child: Image.asset('assets/images/Logo.png'),
          ),
        ],
      ),
    );
  }
}
