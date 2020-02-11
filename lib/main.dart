import 'package:demo_app/common/config/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app.dart' as app;

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupInjections();
    app.main();
}