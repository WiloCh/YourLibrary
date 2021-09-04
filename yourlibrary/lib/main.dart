import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourlibrary/src/providers/app_provider.dart';
import 'package:yourlibrary/src/utils/user_shared_preferences.dart';
import 'package:yourlibrary/src/providers/notes_provider.dart';
import 'package:yourlibrary/src/widgets/splash/Welcome_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NotesProvider>(create: (_) => NotesProvider()),
      ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
        create: (BuildContext context) => AppProvider(),
        child: Consumer<AppProvider>(builder: (context, provider, __) {
          getDarkMode().then((value) => provider.darkMode = value);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'YourLibrary',
            theme: ThemeData(
              brightness: provider.darkMode == true
                  ? Brightness.dark
                  : Brightness.light,
              primarySwatch: Colors.orange,
              accentColor: Colors.orangeAccent,
            ),
            home: WelcomeScreen(),
            //home: MainPage(titulo: 'YourLibrary'),
          );
        }));
  }
}
