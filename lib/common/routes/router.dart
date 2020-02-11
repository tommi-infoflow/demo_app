import 'package:demo_app/common/routes/routes.dart';
import 'package:demo_app/presentation/pages/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';

abstract class Router {
  static Map<String, WidgetBuilder> routes = {
    Routes.splash : (BuildContext context) => SplashPage(),
  };
}