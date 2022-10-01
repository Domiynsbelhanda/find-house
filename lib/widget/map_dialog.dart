import 'package:flutter/material.dart';
import 'package:karibukwako/models/HomeLocation.dart';
import '../pages/detailHouse.dart';
import 'hotels.dart';

show_room_map_dialog(BuildContext context, HomeLocation rooms) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("FERMER"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  Widget plusButton = TextButton(
    child: Text("VOIR PLUS"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Details(
          data: rooms,
        )),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text('${rooms.categories[0].name} ${rooms.detail.number_pieces} pièces'),
    content: GestureDetector(
      child: Hotels(
          title: '${rooms.categories[0].name.toString().substring(0, 6)} ${rooms.detail.number_pieces} pièces',
          image: 'https://karibukwako.com/storage/${rooms.images}',
          location: '${rooms.address}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(
            data: rooms,
          )),
        );
      },
    ),
    actions: [
      plusButton,
      okButton
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}