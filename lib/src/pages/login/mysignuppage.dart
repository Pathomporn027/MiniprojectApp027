import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/app_route.dart';

class MySignUpPage extends StatefulWidget {
  MySignUpPage({Key key}) : super(key: key);

  @override
  _MySignUpPageState createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade400,
        title: Text('สมัครสมาชิก'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'ชื่อ',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'นามสกุล',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'อีเมล',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'รหัสผ่าน',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('ลงทะเบียน'),
                    onPressed: (){
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: Text('เข้าสู่ระบบ'),
                    onPressed: (){
                      Navigator.pushNamed(context, AppRoute.homeRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0XFFF8bc34a),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),


    );
  }
}//end class