import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karibukwako/widget/url_launcher_files.dart';

class ShowReservation extends StatelessWidget{

  final String datas;

  ShowReservation(this.datas);

  @override
  Widget build(BuildContext context) {

    Widget okButton = TextButton(
      child: Text("FERMER"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // TODO: implement build
      // set up the AlertDialog
      return  AlertDialog(
        title: Text('Réservation réussie'),
        content: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                  'Merci d\'avoir choisi Karibukuako',
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            ),

            SizedBox(height: 8.0,),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Votre reservation est effectuée avec succes, le code de votre reservation est :',
                style: TextStyle(
                    fontSize: 15.0
                ),
              ),
            ),

            SizedBox(height: 8.0,),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                '${datas}',
                style: TextStyle(
                    fontSize: 15.0
                ),
              ),
            ),

            SizedBox(height: 8.0,),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Pour confirmez votre reservation; Veillez nous contacter en cliquant sur le bouton ci-après',
                style: TextStyle(
                    fontSize: 15.0
                ),
              ),
            ),

            SizedBox(height: 8.0),

            GestureDetector(
              onTap: ()=>whatsappCall('+243999999999'),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.green
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.squarePhone,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0,),
                        Text(
                          "Appelez maintenant",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        actions: [
          okButton,
        ],
      );
  }

  // show the dialog

}