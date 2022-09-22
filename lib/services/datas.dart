import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:karibukwako/models/HomeLocation.dart';
import 'package:karibukwako/models/slider.dart';
import '../utils/env.dart';
import 'dio.dart';

class Datas extends ChangeNotifier{
  List<Sliders>? _sliders;
  List<HomeLocation>? _homeLocation;
  bool? _offline = false;
  HomeLocation? _details;
  int? _reservation;

  Env env = Env();

  List<Sliders> get sliders => _sliders!;
  List<HomeLocation> get homeLocation => _homeLocation!;
  bool get offline => _offline!;
  HomeLocation get detail => _details!;
  int get reservation => _reservation!;

  void slide(BuildContext context) async {
    try{
      Dio.Response response = await dio()!.get('/homedata');
      Map<String, dynamic> mapData = jsonDecode(response.data);
      Iterable datas = mapData['sliders'];
      List<Sliders> slidings = List<Sliders>
          .from(datas
          .map((model)=>Sliders.fromJson(model)));
      _sliders = slidings;
      _offline = false;
      notifyListeners();
    } catch(e){
      _offline = true;
      env.showAlertDialog(context, 'Sliders Errors', '$e');
      notifyListeners();
    }
  }

  void homeLoc(BuildContext context) async {
    try{
      Dio.Response response = await dio()!.get('/homedata');
      Map<String, dynamic> mapData = jsonDecode(response.data);
      Iterable datas = mapData['apartments'];

      List<HomeLocation> homes = List<HomeLocation>
          .from(datas
          .map((model)=>HomeLocation.fromJson(model)));

      _homeLocation = homes;
      _offline = false;
      notifyListeners();
    } catch(e){
      _offline = true;
      env.showAlertDialog(context, 'Datas Errors', '$e');
      notifyListeners();
      // Env env = Env();
      // env.showAlertDialog(context, 'Home Errors', '$e');
    }
  }

  void details(BuildContext context, String key) async {
    try{
      Dio.Response response = await dio()!.post('/detail', data: {'id': key});
      Map<String, dynamic> datas = jsonDecode(response.data);
      _reservation = datas['reservations_count'];
      _offline = false;
      notifyListeners();
    } catch(e){
      _offline = true;
      env.showAlertDialog(context, 'Datas Errors', '$e');
      notifyListeners();
    }
  }

  void reservations(BuildContext context, var data) async {
    try{
      Dio.Response response = await dio()!.post('/reservation', data: data);
      String datas = jsonDecode(response.data);
      env.showReservation(context, datas);
      _offline = false;
      notifyListeners();
    } catch(e){
      _offline = true;
      env.showAlertDialog(context, 'Datas Errors', '$e');
      notifyListeners();
    }
  }

  // void categorie() async {
  //   try {
  //     Dio.Response response = await dio()!.get('/homedata');
  //     Iterable datas = jsonDecode(response.data);
  //     // List<Categorie>? cat = List<Categorie>.from(datas.map((model)=> Categorie.fromJson(model)));
  //     // _categories = cat;
  //     print('${datas}');
  //     notifyListeners();
  //   } catch (e){
  //     print(e);
  //   }
  // }

  // void room() async {
  //   try {
  //     Dio.Response response = await dio()!.get('/rooms/all');
  //     Iterable datas = jsonDecode(response.data);
  //     List<Rooms>? rooms = List<Rooms>.from(datas.map((model)=> Rooms.fromJson(model)));
  //     _rooms = rooms;
  //     notifyListeners();
  //   } catch (e){
  //     print(e);
  //   }
  // }

  // void recommandation() async {
  //   try {
  //     Dio.Response response = await dio()!.get('/rooms/recommandation');
  //     Iterable datas = jsonDecode(response.data);
  //     List<Rooms>? rooms = List<Rooms>.from(datas.map((model)=> Rooms.fromJson(model)));
  //     _rooms = rooms;
  //     notifyListeners();
  //   } catch (e){
  //     print(e);
  //   }
  // }

  // void roomNoted() async {
  //   try {
  //     Dio.Response response = await dio()!.get('/rooms/noted');
  //     Iterable datas = jsonDecode(response.data);
  //     List<Rooms>? rooms = List<Rooms>.from(datas.map((model)=> Rooms.fromJson(model)));
  //     _noted = rooms;
  //     notifyListeners();
  //   } catch (e){
  //     print(e);
  //   }
  // }

  // void reservation ({required Map creds, required BuildContext context}) async {
  //
  //   try {
  //     Dio.Response response = await dio()!.post('/rooms/reservation', data: creds);
  //     if(response.statusCode == 200){
  //       var res = jsonDecode(response.data);
  //       if(res['code'] == 1){
  //         showAlertDialog(context, 'Reservation', '${res['data'].toString()}');
  //       } else {
  //         showAlertDialog(context, 'Reservation', '${res['data'].toString()}');
  //       }
  //     }
  //   } catch (e){
  //     showAlertDialog(context, 'Reservation', '${e.toString()}');
  //   }
  // }
}