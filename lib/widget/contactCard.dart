import 'package:flutter/material.dart';

import '../utils/env.dart';

class ContactCard extends StatelessWidget{

  IconData icons;
  String title;
  String description;

  ContactCard({required this.icons, required this.title, required this.description});

  Env env = Env();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Card(
        elevation: 3.0,
        child: Container(
          width: env.size(context).width / 1.1,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  icons,
                  size: env.size(context).width / 10,
                  color: Color.fromRGBO(3, 100, 176, 65),
                ),

                SizedBox(height: 8.0,),

                Text(
                  '$title',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: env.size(context).width / 20
                  ),
                ),

                SizedBox(height: 8.0),

                Text(
                  '$description',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: env.size(context).width / 25
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}