import 'package:flutter/material.dart';
import 'package:yourlibrary/src/models/user_model.dart';
import 'package:yourlibrary/src/providers/login_provider.dart';
import 'package:yourlibrary/src/services/user_service.dart';
import 'package:yourlibrary/src/utils/login_widgets.dart';
import 'package:yourlibrary/src/widgets/splash/login_screen.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                  UsernameTextControl(),
                  SizedBox(height: 20.0),
                  EmailTextControl(),
                  SizedBox(height: 20.0),
                  PasswordTextControl(),
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

class UsernameTextControl extends StatelessWidget {
  const UsernameTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.ofSing(context);
    return StreamBuilder(
      stream: bloc.usernameStream,
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
                hintText: 'Nombre de Usuario',
                labelText: 'Usuario',
                errorText: snapshot.error?.toString()),
            onChanged: bloc.changeUsername,
          ),
        );
      },
    );
  }
}

class EmailTextControl extends StatelessWidget {
  const EmailTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.ofSing(context);
    return StreamBuilder(
      stream: bloc.emailStream,
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
            onChanged: bloc.changeEmail,
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
    final bloc = LoginProvider.ofSing(context);
    return StreamBuilder(
      stream: bloc.passwordStream,
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
            obscureText: true,
            onChanged: bloc.changePassword,
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
    UserService userService = new UserService();
    final bloc = LoginProvider.ofSing(context);
    return StreamBuilder(
      stream: bloc.formSingUpValidStream,
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
            onPressed: snapshot.hasData
                ? () async {
                    User user = new User();
                    user.displayName = bloc.username;
                    user.email = bloc.email;
                    user.password = bloc.password;
                    bool create = await userService.sendUser(user);
                    if (create) {
                      Navigator.pop(context);
                    } else {
                      print("Error al crear el usuario");
                    }
                  }
                : null);
      },
    );
  }
}
