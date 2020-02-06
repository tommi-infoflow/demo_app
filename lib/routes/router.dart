import 'package:demo_app/pages/splash/splash_page.dart';
import 'package:demo_app/routes/routes.dart';
import 'package:flutter/cupertino.dart';

abstract class Router {
  static Map<String, WidgetBuilder> routes = {
    Routes.splash : (BuildContext context) => SplashPage(),
  };
}