import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karibukwako/widget/contactCard.dart';

import '../utils/env.dart';

class ContactPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContactPage();
  }
}

class _ContactPage extends State<ContactPage>{

  Env env = Env();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 252),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: env.size(context).width / 1.2,
                child: Text(
                  'Pour tout besoin, n\'hesitez pas de nous contactactez',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: env.size(context).width / 20,
                  ),
                ),
              ),

              SizedBox(height: 16.0,),

              ContactCard(
                  icons: FontAwesomeIcons.squarePhone,
                  title: 'Numéro Téléphone',
                  description: '+ 243 990 416 691'
              ),

              SizedBox(height: 16.0,),

              ContactCard(
                  icons: FontAwesomeIcons.mapLocationDot,
                  title: 'Adresse physique',
                  description: '7680, Avenue des Roches, Q/Ludo Golf, Lubumbashi'
              ),

              SizedBox(height: 16.0,),

              ContactCard(
                  icons: FontAwesomeIcons.envelope,
                  title: 'Adresse email',
                  description: 'info@karibukwako.com'
              ),
            ],
          ),
        )
      ),
    );
  }
}