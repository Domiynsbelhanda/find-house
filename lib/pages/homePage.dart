import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/datas.dart';
import '../utils/env.dart';
import '../widget/home_caroussel_item.dart';
import '../widget/recommand_item.dart';

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
                child: Row(
                  children: Provider.of<Datas>(context, listen: false).sliders
                      .map((e)=>ItemCaroussel(
                    context: context,
                    data: e,
                  )).toList(),
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: getRecommend(),
            )
          ],
        ),
      ),
    );
  }

  getRecommend() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          Provider.of<Datas>(context, listen: false).homeLocation.length,
              (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RecommendItem(
              data: Provider.of<Datas>(context, listen: false).homeLocation[index],
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Details(
                //     data: Provider.of<Datas>(context, listen: false).homeLocation[index],
                //   )),
                // );
              },
            ),
          ),
        ),
      ),
    );;
  }
}