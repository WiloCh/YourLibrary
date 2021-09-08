import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:yourlibrary/src/pages/main_page.dart';
import 'package:yourlibrary/src/providers/app_provider.dart';
import 'package:yourlibrary/src/providers/login_provider.dart';
import 'package:yourlibrary/src/utils/user_shared_preferences.dart';
import 'package:yourlibrary/src/providers/notes_provider.dart';
//import 'package:yourlibrary/src/widgets/splash/Welcome_screen.dart';
import 'package:yourlibrary/src/widgets/splash/login_screen.dart';
import 'package:yourlibrary/src/widgets/splash/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences().init();
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
  final prefs = new Preferences();

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: true);
    appProvider.init(prefs.token, prefs.mode);
    return LoginProvider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YourLibrary',
      home: appProvider.token == ""
          ? const LoginPage()
          : JwtDecoder.isExpired(appProvider.token)
              ? const LoginPage()
              : const MainPage(titulo: "YourLibrary"),
      routes: {
        "/login": (context) => const LoginPage(),
        "/signUp": (context) => RegisterPage(),
        "/settings": (context) => const LoginPage(),
      },
      theme: ThemeData(
          brightness:
              appProvider.darkMode == true ? Brightness.dark : Brightness.light,
          primarySwatch: Colors.amber),
    ));
  }
}
