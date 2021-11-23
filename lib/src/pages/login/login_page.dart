import 'package:another_flushbar/flushbar.dart';
import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/configs/app_setting.dart';
import 'package:miniproject/src/services/network.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = false;

  final _usernameController = TextEditingController();
  final _passwoldController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwoldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text('Login'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xfff2980B9),
                      Color(0xfff6DD5FA),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 1]),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                Image.network(
                  'https://www.17suudubaaba.com/wp-content/uploads/2021/02/user.png',
                  width: 100,
                  height: 80,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _usernameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'username',
                          hintText: 'xx@mail.com',
                          icon: Icon(
                            Icons.person,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      TextField(
                        controller: _passwoldController,
                        obscureText: isHidden,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'password',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.green,
                          ),
                          suffixIcon: IconButton(
                            icon: isHidden
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: togglePasswordVisibility,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final username = _usernameController.text;
                          final password = _passwoldController.text;
                          print('login with $username $password');

                          final message = await NetworkService()
                              .validateUserLoginDio(username, password);

                          if (message != 'failed') {
                            print('login success');
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString(
                                AppSetting.userNameSetting, username);
                            prefs.setString(
                                AppSetting.passwordSetting, password);

                            Navigator.pushNamed(context, AppRoute.homeRoute);
                          } else {
                            print('login failed');
                            Flushbar(
                              title: "login failed",
                              titleColor: Colors.red,
                              icon: Icon(
                                Icons.cancel,
                                size: 35,
                                color: Colors.red,
                              ),
                              message: "ข้อมูลไม่ถูกต้อง!",
                              duration: Duration(seconds: 5),
                            )..show(context);
                          }
                        },
                        child: Text('LOGIN'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFFFff7043),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        child: Text('SIGN UP'),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoute.subscribeRoute);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFFF8bc34a),
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
