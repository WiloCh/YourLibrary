import 'package:flutter/material.dart';
import 'package:yourlibrary/src/pages/notes_page.dart';
import 'package:yourlibrary/src/pages/settings_page.dart';

class ShopDrawer extends StatefulWidget {
  ShopDrawer({Key? key}) : super(key: key);

  @override
  _ShopDrawerState createState() => _ShopDrawerState();
}

class _ShopDrawerState extends State<ShopDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/images/LibroIcon.jpg'),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Perfil'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Apuntes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.build),
            title: Text('Tema'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Acerca de'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
