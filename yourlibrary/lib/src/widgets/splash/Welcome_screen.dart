import 'package:flutter/material.dart';
import 'package:yourlibrary/src/utils/login_widgets.dart';
import 'package:yourlibrary/src/widgets/splash/login_screen.dart';
import 'package:yourlibrary/src/widgets/splash/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: DrawClip(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.8,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.amber.shade400,
                          Colors.amberAccent.shade700
                        ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.bottomRight)),
                  ),
                ),
                ClipPath(
                  clipper: DrawClip2(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.8,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.amberAccent.shade700,
                      Colors.amber.shade900
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/LogoFondo.png'),
                          radius: 120,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 390, left: 40),
                  child: Text(
                    "Bienvenido",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BtnStyle(
                      Color1: Colors.amber.shade800,
                      Color2: Colors.amber.shade200,
                      text: "Iniciar Sesión",
                      Pressed: LoginPage(),
                      Colortext: Colors.black87),
                  SizedBox(height: 25),
                  BtnStyle(
                      Color1: Colors.orange.shade900,
                      Color2: Colors.orange.shade600,
                      text: "Registrarse",
                      Pressed: RegisterPage(),
                      Colortext: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.80);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 2, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DrawClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.80);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 2, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
