import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade500,
        title: Text('โปรไฟล์'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfffFFFFF),
                  Color(0xfffFFFFF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.25,1]
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/Most.jpg'),
              ),
              SizedBox(
                height: 20,
                ),

              Text(
                'Pathomporn Wannaphueak',
                style: TextStyle(
                    fontSize: 22, color: Colors.redAccent.shade100, fontFamily: 'Pacifico'),
              ),
              Text(
                'STUDENT',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.teal.shade800,
                    fontFamily: 'Source Sans Pro'),
              ),
              SizedBox(
                width: 200,
                height: 30,
                child: Divider(
                  color: Colors.red.shade800,
                  thickness: 5,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 70,
                ),
                padding: EdgeInsets.all(10),
                color: Colors.deepOrange.shade50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.sticky_note_2_outlined,
                      color: Colors.deepOrange.shade500,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('StudentID : 624235027')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 70,
                ),
                padding: EdgeInsets.all(10),
                color: Colors.deepOrange.shade50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.local_phone_outlined,
                      color: Colors.teal.shade500,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Tell : 065075826')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                padding: EdgeInsets.all(10),
                color: Colors.deepOrange.shade50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.account_box_sharp,
                      color: Colors.yellowAccent.shade400,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('E-mail : 624235027@parichat.skru.ac.th')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
