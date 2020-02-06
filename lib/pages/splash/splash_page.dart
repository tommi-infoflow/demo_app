import 'dart:async';

import 'package:demo_app/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SplashPage());

class SplashPage extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {

@override
void initState(){
  super.initState();
  startSplashScreen();
}

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_){
          return HomePage();
        })
      );
    }
  );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Image.asset('assets/images/movie.png'),
    );
  }
}
