import 'package:flutter/material.dart';
import 'package:yourlibrary/src/widgets/splash/Welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var d = Duration(seconds: 3);
    // retrasar 3 segundos hasta la página siguiente
    Future.delayed(d, () {
      // a la página siguiente y cerrar esta página
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WelcomeScreen();
          },
        ),
        (route) => false,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/LogoSinTrans.png'),
            radius: 150,
          ),
        ),
      ),
    );
  }
}
