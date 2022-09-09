import 'package:flutter/material.dart';
import 'package:karibukwako/widget/showAlertDialog.dart';

class Env {
  Color primaryColor = const Color(0xff6153ac);
  Color secondaryColor = const Color(0xff70c5d5);

  showAlertDialog(BuildContext context, String titre, String description){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowAlertDialog(titre, description);
      },
    );
  }
}