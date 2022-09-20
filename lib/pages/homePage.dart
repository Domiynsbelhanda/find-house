import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/datas.dart';
import '../utils/env.dart';
import '../widget/home_caroussel_item.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage>{

  Env env = Env();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // child: Text('Belhanda'),
                child: Consumer<Datas>(
                  builder: (context, datas, child){
                    try {
                      return Row(
                        children: datas.sliders.map((e)=>ItemCaroussel(
                          context: context,
                          data: e,
                        )).toList(),
                      );
                    } catch (e){
                      return env.showAlertDialog(context, 'Erreur', 'Vérifiez votre connexion internet');
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}