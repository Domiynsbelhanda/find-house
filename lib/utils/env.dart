import 'package:flutter/material.dart';
import 'package:karibukwako/widget/showAlertDialog.dart';

import '../widget/showReservation.dart';

class Env {
  Color primaryColor = const Color(0xff6153ac);
  Color secondaryColor = const Color(0xff70c5d5);

  static const int ANIMATED_BODY_MS = 500;

  Size size(BuildContext context){
    return MediaQuery.of(context).size;
  }

  showAlertDialog(BuildContext context, String titre, String description){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowAlertDialog(titre, description);
      },
    );
  }

  showReservation(BuildContext context, String datas){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowReservation(datas);
      },
    );
  }
}