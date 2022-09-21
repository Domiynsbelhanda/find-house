import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/datas.dart';
import '../utils/env.dart';
import '../widget/feature_item.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(right: 16.0, top: 16.0),
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: Provider.of<Datas>(context, listen: false).sliders
            //           .map((e)=>ItemCaroussel(
            //         context: context,
            //         data: e,
            //       )).toList(),
            //     )
            //   ),
            // ),

            const Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: const Text(
                'Meilleures maisons',
                style: const TextStyle(
                    fontSize: 20.0
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: getFeature(),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                'Nouvelles offres',
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: getRecommend(),
            ),
          ],
        ),
      ),
    );
  }

  getFeature() {
    try{
      return CarouselSlider(
        options: CarouselOptions(
          height: 312,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .75,
        ),
        items: List.generate(
          Provider.of<Datas>(context, listen: false).homeLocation.length < 6
              ? Provider.of<Datas>(context, listen: false).homeLocation.length : 6,
              (index) => FeatureItem(
            data: Provider.of<Datas>(context, listen: false).homeLocation[index],
            onTapFavorite: () {
              setState(() {
                // features[index]["is_favorited"] =
                // !features[index]["is_favorited"];
              });
            },
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Details(
              //     data: datas.rooms[index],
              //   )),
              // );
            },
          ),
        ),
      );
    }
    catch(e) {
      return Center(
        child: Text('Vérifiez votre connexion internet')
      );
    }
  }

  getRecommend() {
    try{
      return SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
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
      );
    } catch(e){
      return SizedBox();
    }
  }
}