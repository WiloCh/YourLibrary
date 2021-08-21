import 'package:flutter/material.dart';
import 'package:yourlibrary/src/pages/main_page.dart';
import 'package:yourlibrary/src/utils/login_widgets.dart';
import 'package:yourlibrary/src/widgets/splash/login_screen.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: LoginBackground("Registrarse"),
            ),
            SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  EmailTextControl(),
                  SizedBox(height: 20.0),
                  PasswordTextControl(),
                  SizedBox(height: 20.0),
                  RepitPasswordTextControl(),
                  SizedBox(height: 25.0),
                  SubmitButtonControl(),
                  SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      'Ya tienes una cuenta? Inicia Secion',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailTextControl extends StatelessWidget {
  const EmailTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.grey.shade300,
          ),
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.email, color: Colors.orange),
                border: InputBorder.none,
                hintText: 'usuario@correo.com',
                labelText: 'Ingresa tu Correo electrónico',
                errorText: snapshot.error?.toString()),
          ),
        );
      },
    );
  }
}

class PasswordTextControl extends StatelessWidget {
  const PasswordTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.grey.shade300,
          ),
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.vpn_key, color: Colors.orange),
                border: InputBorder.none,
                labelText: 'Contraseña',
                errorText: snapshot.error?.toString()),
          ),
        );
      },
    );
  }
}

class RepitPasswordTextControl extends StatelessWidget {
  const RepitPasswordTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.grey.shade300,
          ),
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Colors.orange),
                border: InputBorder.none,
                labelText: 'Contraseña',
                errorText: snapshot.error?.toString()),
          ),
        );
      },
    );
  }
}

class SubmitButtonControl extends StatelessWidget {
  const SubmitButtonControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            padding: EdgeInsets.all(0.0),
          ),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade900, Colors.orange.shade600],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: const Text(
                "Registrarse",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPage(titulo: "YourLibrary")));
          },
        );
      },
    );
  }
}
