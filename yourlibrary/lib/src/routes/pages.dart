import 'package:flutter/widgets.dart';
import 'package:yourlibrary/src/request_permission/request_permission_page.dart';
import 'package:yourlibrary/src/routes/routes.dart';
import 'package:yourlibrary/src/widgets/content/libraries_widget.dart';
import 'package:yourlibrary/src/widgets/splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => SplashPage(),
    Routes.PERMISSIONS: (_) => RequestPermissionPage(),
    Routes.HOME: (_) => LibrariesWidget(),
  };
}
