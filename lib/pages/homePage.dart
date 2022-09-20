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
                child: Row(
                  children: Provider.of<Datas>(context, listen: false).sliders
                      .map((e)=>ItemCaroussel(
                    context: context,
                    data: e,
                  )).toList(),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}