import 'dart:async';

import 'package:demo_app/presentation/pages/home/home_page.dart';
import 'package:demo_app/presentation/pages/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(SplashPage());

class SplashPage extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var user = _prefs.getString('userToken');

    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      if (user == null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return LoginPage();
        }));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return HomePage();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Icon(Icons.live_tv, size: 150, color: Colors.red,),
        // Text('Omdb App', style: TextStyle(fontFamily: ),)
      ],)      
      //Image.asset('assets/images/movie.png',),
    );
  }
}
