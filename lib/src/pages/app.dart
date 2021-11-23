import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute().getAll,
      theme: ThemeData(primaryColor: Colors.indigoAccent),
      home: HomePage(),
      // home: FutureBuilder(
      //   //future: SharedPreferences.getInstance(),
      //   builder: (context, snapshot) {
      //     if(!snapshot.hasData){
      //       return Container(color: Colors.white,);
      //     }
      //     final token = snapshot.data.toString();
      //     if(token != null){
      //       return HomePage();
      //     }else {
      //       return LoginPage();
      //     }
      //   },
      // ),
    );
  }
} //end class