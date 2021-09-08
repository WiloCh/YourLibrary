import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yourlibrary/src/providers/app_provider.dart';
import 'package:yourlibrary/src/providers/login_provider.dart';
import 'package:yourlibrary/src/services/user_service.dart';
import 'package:yourlibrary/src/utils/login_widgets.dart';
import 'package:yourlibrary/src/widgets/splash/register_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

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
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.grey),
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
    final bloc = LoginProvider.of(context);
    bool _obscure = true;
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            onChanged: bloc.changePassword,
            obscureText: _obscure,
            decoration: InputDecoration(
                icon: Icon(Icons.vpn_key, color: Colors.orange),
                border: InputBorder.none,
                labelText: 'Contraseña',
                errorText: snapshot.error?.toString(),
                suffixIcon: IconButton(
                    icon: Icon(
                        _obscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      bloc.changePassword;
                      _obscure = !_obscure;
                    })),
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
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    UserService userService = new UserService();
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
              child: Text('Ingresar'),
            ),
            onPressed: snapshot.hasData
                ? () async {
                    Map info =
                        await userService.login(bloc.email, bloc.password);
                    if (info['ok']) {
                      appProvider.token = info['token'];
                    } else {
                      print(info['message']);
                    }
                  }
                : null);
      },
    );
  }
}
