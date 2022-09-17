import 'package:flutter/material.dart';

import '../utils/env.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State<HomePage>{

  Env env = new Env();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: env.size(context).width,
                height: env.size(context).height * 0.5,
                decoration: BoxDecoration(

                ),
                child: Stack(
                  children: [
                    Container(
                      height: (env.size(context).height * 0.5) - 96,
                      width: env.size(context).width,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}