import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourlibrary/src/providers/app_provider.dart';
import 'package:yourlibrary/src/utils/user_shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // ignore: avoid_init_to_null
  bool? darkModePrefs = null;

  @override
  void initState() {
    super.initState();
    _loadDarkModePrefs();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          darkModePrefs == null
              ? Container()
              : Card(
                  elevation: 5.0,
                  child: ListTile(
                    title: Text("Modo Oscuro",
                        style: Theme.of(context).textTheme.bodyText1),
                    subtitle: Text(
                        "El modo oscuro permite a la aplicación usar un fondo opaco con un contraste de letras blancas.",
                        style: Theme.of(context).textTheme.caption),
                    leading: Checkbox(
                        value: darkModePrefs,
                        onChanged: (value) {
                          appProvider.darkMode = value ?? false;
                          setDarkMode(value ?? false);
                          if (value == true) {
                            print("Modo nocturno activado");
                          } else {
                            print("Modo nocturno desactivado");
                          }
                          Navigator.pop(context);
                        }),
                  ),
                )
        ],
      ),
    );
  }

  _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {});
  }
}
