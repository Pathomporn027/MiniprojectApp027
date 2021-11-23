import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/configs/app_setting.dart';
import 'package:miniproject/src/widgets/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//หน้าโฮม หน้าหลัก

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current =0;
  final urlImage = 'https://www.saphanmai.com/wp-content/uploads/2020/03/1.jpg';
  final List<String> imgList = [
    'https://th1-cdn.pgimgs.com/listing/7946057/UPHO.76123496.V550/dcondo-Hatyai-%E0%B8%94%E0%B8%B5%E0%B8%84%E0%B8%AD%E0%B8%99%E0%B9%82%E0%B8%94-%E0%B8%AB%E0%B8%B2%E0%B8%94%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88-%E0%B8%AB%E0%B8%B2%E0%B8%94%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88-Thailand.jpg',
    'https://news.gimyong.com/attachment/image/62038',
    'https://www.well-graded.com/wp-content/uploads/2018/01/D-condo-karnjanavanich1-870x489.jpg',
    'https://files.hipcdn.com/listing-photos/60b73447a12eda245f0005cf/dbeb48bf-7ca4-4a90-ab0d-0b6d86b44667_small@2x.jpg',
    'https://www.well-graded.com/wp-content/uploads/2018/01/IMG_5965-1170x658.jpg',
    'https://www.directoryweblink.com/wp-content/uploads/2019/07/condo-737x415.jpg'
  ];

  List<Map<String, String>> imgArray = [
    {
      "img":
      "https://sg2-cdn.pgimgs.com/projectnet-project/60419/ZPPHO.102022143.R800X800.jpg",
      "title": "Plus Condominium",
      "description":
      " ",
      "price": "\$9,000",
      "page": " "
    },
    {
      "img":
      "https://zmyhome.com/userImg/P850/62850/5a1e7c3151587.jpg",
      "title": " ",
      "description":
      " ",
      "price": " ",
      "page": " "
    },
    {
      "img":
      "https://cdn-images.prod.thinkofliving.com/wp-content/uploads/1/2018/06/MAIN_GATE_180509.jpg",
      "title": "DCondo Hatyai",
      "description":
      " ",
      "price": "\$10,000 ",
      "page": " "
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Column(
          // Important: Remove any padding from the ListView.
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Most'),
              accountEmail: Text('624235027@parichat.skru.ac.th'),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Most.jpg'),
              ),
            ),
            ...MenuViewModel()
                .items
                .map((e) => ListTile(
              leading: Icon(
                e.icon,
                color: e.iconColor,
              ),
              title: Text(e.title),
              onTap: () {
                e.onTap(context);
                // Update the state of the app.
                // ...
              },
            ))
                .toList(),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title:  Text('ออกจากระบบ'),

              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(AppSetting.userNameSetting);
                prefs.remove(AppSetting.passwordSetting);
                Navigator.pushNamed(context, AppRoute.LoginRoute);

              },
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text('หน้าหลัก'),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bgwhite12.jpeg'),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.cover,
            )
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 20),
            CarouselSlider.builder(
              itemCount: imgList.length,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  child: Center(
                      child: Image.network(imgList[index],
                          fit: BoxFit.cover, width: 1000)),
                );
              },
            ),
            SizedBox(height : 30),
            Container(
              color: Colors.white60,
              child: Text(
                'Menu',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {

                  },
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoute.ApartmentRoute);
                      },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/images/aparment.jpg'), scale: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(''),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoute.condoRoute);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/condo.jpg'),
                          scale: 10),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoute.mapRoute);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/location.jpg'), scale: 10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoute.dormRoute);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/domitory.jpg'), scale: 4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('')],
                    ),
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {

                  },
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoute.roomaddRoute);
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/images/addroom.jpg'),scale: 4),

                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {

                  },
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoute.LoginRoute);

                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/images/logout.jpg'),
                            scale: 1),
                      ),
                    ),
                  ),
                )

              ],
            ),
            SizedBox(height: 5),
            ListTile(
              onTap: (){
              },
            ),
            SizedBox(height: 20),
            CarouselSlider(
              items: imgArray
                  .map((item) => GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, item["page"]);
                },
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                                blurRadius: 8,
                                spreadRadius: 0.3,
                                offset: Offset(0, 3))
                          ]),
                          child: AspectRatio(
                            aspectRatio: 2 / 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                item["img"],
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                            children: [
                            Text(item["price"],
                            style: TextStyle(
                                fontSize: 16, color: Colors.cyan)),
                        Text(item["title"],
                            style:
                            TextStyle(fontSize: 32, color: Colors.black)),
                        Padding(
                           padding: const EdgeInsets.only(
                          //   left: 16.0, right: 16.0, top:
                          //    // child: Text(
                          //    //   item["description"],
                          //    //   style: TextStyle(
                          //    //       fontSize: 16, color: Colors.red),
                          //    //   textAlign: TextAlign.center,
                           ),
                          )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
                  .toList(),
              options: CarouselOptions(
                  height: 530,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  aspectRatio: 4 / 4,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  // viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}//end class