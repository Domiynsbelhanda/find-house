import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../main.dart';
import '../models/user.dart';
import 'dio.dart';

class Auth extends ChangeNotifier{
  bool _isLoggedIn = false;
  User? _user;
  String? _token;

  bool get authenticated => _isLoggedIn;
  User get user => _user!;

  final storage = new FlutterSecureStorage();

  void login ({required Map creds, required BuildContext context}) async {

    try {
      Dio.Response response = await dio()!.post('/sanctum/token', data: creds);
      if(response.statusCode == 200){
        var res = jsonDecode(response.data);
        if(res['code'] == 1){
          String token = res['token'].toString();
          this.tryToken(token: token, context: context);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyApp())
          );
        } else {
          showAlertDialog(context, 'Authentification', '${res['data'].toString()}');
        }
      }
    } catch (e){
      showAlertDialog(context, 'Authentification', '${e.toString()}');
    }
  }

  void register ({required Map creds, required BuildContext context}) async {

    try {
      Dio.Response response = await dio()!.post('/register', data: creds);
      if(response.statusCode == 200){
        var res = jsonDecode(response.data);
        if(res['code'] == 1){
          String token = res['token'].toString();
          this.tryToken(token: token, context: context);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyApp())
          );
        } else {
          showAlertDialog(context, 'Authentification', '${res['data'].toString()}');
        }
      }
    } catch (e){
      showAlertDialog(context, 'Authentification', '${e.toString()}');
    }
  }

  void tryToken({required String token, required BuildContext context}) async {
    if(token == null){
      return;
    } else {
      try {
        Dio.Response response = await dio()!.get('/user',
            options: Dio.Options(
                headers: {'Authorization' : 'Bearer $token'}
            )
        );
        this._isLoggedIn = true;
        this._user = User.fromJson(response.data);
        this._token = token;
        this.storeToken(token: token);
        notifyListeners();
      } catch (e){
        print('Errorification : $e');
        showAlertDialog(context, 'User Profile', '${e.toString()}');
      }
    }
  }

  void storeToken({required String token}) async{
    this.storage.write(key: 'token', value: token);
  }

  void logout() async{
    try {
      Dio.Response response = await dio()!.get('/user/revoke',
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'})
      );
      cleanUp();
      notifyListeners();
    } catch (e){

    }
  }

  void cleanUp() async {
    this._user = null;
    this._isLoggedIn = false;
    this._token = null;
    await storage.delete(key: 'token');
  }
}