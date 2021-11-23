import 'dart:convert';
import 'dart:io';
import 'package:miniproject/src/configs/api.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:miniproject/src/pages/model/amp_model.dart';
import 'package:miniproject/src/pages/model/condo_model.dart';
import 'package:miniproject/src/pages/model/dormitory_model.dart';


class NetworkService{
  NetworkService._internal();

  static final NetworkService _instace = NetworkService._internal();

  factory NetworkService() => _instace;

  static final Dio _dio = Dio();






  Future<String> validateUserLoginDio(String username, String password) async {
    FormData data = FormData.fromMap({
      'username': username,
      'password': password,
    });
    try {
      //var url = API.BASE_URL + '/flutterapp/f_user_login.php';
      //var url = API.BASE_URL + '/api/user';
      var url = API.BASE_URL + '/flutterapi/api/user';
      final response = await _dio.post(url, data: data);
      print(response);
      if (response.statusCode == 200) {
        var jsonString = response.data;
        // var jsonMap = json.encode(jsonString);
        String username = jsonString["username"];
        print('username = ' + username);
        String password = jsonString["password"];
        print('password = ' + password);
        if (username != 'failed') {
          return 'pass';
        } else {
          return 'failed';
        }
      } else {
        return 'failed';
      }
    } catch (Exception) {
      throw Exception('Network failed');
    }
  }

  Future<String> deleteGameDio(String id) async {
    print(API.BASE_URL + API.GAME_URL + '/' + id);
    final response = await _dio.delete(API.BASE_URL + API.GAME_URL + '/' + id);

    if (response.statusCode == 200) {
      if (response.data > 0) {
        return 'Delete Successfully';
      } else {
        return 'Delete Failed';
      }
    }
    throw Exception('Network failed');
  } //end
  Future<CondoModel> getAllCondoDio() async {
    //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
    var url = API.BASE_URL + API.CONDO;
    print('url getAllCondoDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return condoModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<ApartmentModel> getAllApmDio() async {
    //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
    var url = API.BASE_URL + API.APARTMENT;
    print('url getAllApmDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return apartmentModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<DormitorModel> getAllDmDio() async {
    //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
    var url = API.BASE_URL + API.DORMITORY;
    print('url getAllDmDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return dormitorModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

} // end

