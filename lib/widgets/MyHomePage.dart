import 'package:demo_app/pages/splash.dart';
import 'package:demo_app/widgets/BottomContent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyScaffold.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      header: AppBar(title: Text('Movie API'), backgroundColor: Colors.grey,),
      body: Container(),
      footer: BottomContent(),
    );
  }
}
