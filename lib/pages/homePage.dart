import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../services/datas.dart';
import '../utils/env.dart';
import '../widget/feature_item.dart';
import '../widget/home_caroussel_item.dart';
import '../widget/recommand_item.dart';
import 'detailHouse.dart';

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
    Provider.of<Datas>(context, listen: false).slide(context);
    Provider.of<Datas>(context, listen: false).homeLoc(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: null,
                // onTap: ()=>Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => FilterPage(
                //     allTextList: datas.rooms,
                //     selectedUserList: [],
                //   )),
                // ),
                child: Container(
                  height: env.size(context).width / 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black.withOpacity(0.4),
                    border: Border.all(
                      color: env.primaryColor,
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rechercher',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: Colors.deepPurple,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

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
    return Consumer<Datas>(
        builder: (context, datas, child){
          try{
            return CarouselSlider(
              options: CarouselOptions(
                height: 312,
                enlargeCenterPage: true,
                disableCenter: true,
                viewportFraction: .75,
              ),
              items: List.generate(
                datas.homeLocation.length < 6
                    ? datas.homeLocation.length : 6,
                    (index) => FeatureItem(
                  data: datas.homeLocation[index],
                  onTapFavorite: () {
                    setState(() {
                      // features[index]["is_favorited"] =
                      // !features[index]["is_favorited"];
                    });
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Details(
                        data: Provider.of<Datas>(context, listen: false).homeLocation[index],
                      )),
                    );
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
        );
  }

  getRecommend() {
    return Consumer<Datas>(
      builder: (context, datas, child){
        try{
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                datas.homeLocation.length,
                    (index) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: RecommendItem(
                    data: datas.homeLocation[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Details(
                          data: datas.homeLocation[index],
                        )),
                      );
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
    );
  }

  @override
  void initState() {
    Provider.of<Datas>(context, listen: false).slide(context);
    Provider.of<Datas>(context, listen: false).homeLoc(context);
  }
}