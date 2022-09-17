import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:karibukwako/models/slider.dart';
import '../utils/env.dart';
import 'dio.dart';

class Datas extends ChangeNotifier{
  List<Sliders>? _sliders;

  List<Sliders> get sliders => _sliders!;

  void slide(BuildContext context) async {
    try{
      Dio.Response response = await dio()!.get('/homedata');
      Map<String, dynamic> mapData = jsonDecode(response.data);
      Iterable datas = mapData['sliders'];
      List<Sliders> slidings = List<Sliders>
          .from(datas
          .map((model)=>Sliders.fromJson(model)));
      _sliders = slidings;
      notifyListeners();
    } catch(e){
      Env env = new Env();
      env.showAlertDialog(context, 'Sliders Errors', '$e');
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