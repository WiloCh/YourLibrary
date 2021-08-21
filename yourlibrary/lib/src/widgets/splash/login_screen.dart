import 'package:flutter/material.dart';
import 'package:yourlibrary/src/pages/main_page.dart';
import 'package:yourlibrary/src/utils/login_widgets.dart';
import 'package:yourlibrary/src/widgets/splash/register_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: LoginBackground("Iniciar Secion"),
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
                  SizedBox(height: 25.0),
                  SubmitButtonControl(),
                  SizedBox(height: 30.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      'Crear una Nueva Cuenta',
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

class SubmitButtonControl extends StatelessWidget {
  const SubmitButtonControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
            child: Text('Ingresar'),
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
