import 'package:flutter/material.dart';

class ShowAlertDialog extends StatelessWidget{

  final String titre;
  final String description;

  ShowAlertDialog(this.titre, this.description);

  @override
  Widget build(BuildContext context) {

    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // TODO: implement build
      // set up the AlertDialog
      return  AlertDialog(
        title: Text('$titre'),
        content: Text('$description.'),
        actions: [
          okButton,
        ],
      );
  }

  // show the dialog

}