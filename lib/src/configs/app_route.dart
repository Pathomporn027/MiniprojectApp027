import 'package:miniproject/src/pages/login/mysignuppage.dart';
import 'package:miniproject/src/pages/map/google_map_page.dart';
import 'package:miniproject/src//pages/pages.dart';
import 'package:miniproject/src/pages/most/apm_page.dart';
import 'package:miniproject/src/pages/most/condo_page.dart';
import 'package:miniproject/src/pages/most/dormitory_page.dart';
import 'package:miniproject/src/pages/most/room_page.dart';
import 'package:miniproject/src/pages/most/roomadd_page.dart';
import 'package:miniproject/src/pages/room/amp_detail_page.dart';
import 'package:miniproject/src/pages/room/condo_detail_page.dart';
import 'package:miniproject/src/pages/room/dormitory_detail_page.dart';

import 'package:flutter/material.dart';

class AppRoute{
  static const mapRoute = 'map';
  static const subscribeRoute ='subscribe';
  static const roomRoute ='room';
  static const condoRoute ='condo';
  static const ApartmentRoute = 'Apartment';
  static const condoDetailRoute = 'condoDetail';
  static const ampDetailRoute = 'ampDetail';
  static const roomaddRoute = 'roomadd';
  static const dormRoute = 'dorm';
  static const dormDetailRoute = 'dormDetail';
  static const LoginRoute = 'login';
  static const infoRoute = 'info';
  static const homeRoute = 'home';


  final _route = <String, WidgetBuilder>{
    homeRoute : (context) => HomePage(),
    infoRoute : (context) => InfoPage(),
    LoginRoute : (context) => LoginPage(),
    mapRoute : (context) => GoogleMapPage(),
    subscribeRoute : (context) => MySignUpPage(),
    roomRoute : (context) => RoomPage(),
    condoRoute : (context) => CondoPage (),
    ApartmentRoute : (context) => ApmPage(),
    condoDetailRoute : (context) => CondoDetailPage (),
    ampDetailRoute : (context) => ApmDetailPage (),
    roomaddRoute : (context) => RoomaddPage (),
    dormRoute : (context) => DmPage(),
    dormDetailRoute : (context) => DmDetailPage(),


  };
  get getAll => _route;
} //end