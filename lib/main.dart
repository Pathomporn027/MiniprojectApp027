import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/pages/app.dart';
import 'package:miniproject/src/pages/home/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoute().getAll,
      theme: ThemeData(primaryColor: Colors.indigoAccent),
      home: HomePage(),);
  }
} //end class