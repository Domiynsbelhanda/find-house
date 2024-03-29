import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/datas.dart';
import '../utils/env.dart';
import '../widget/hotels.dart';
import '../widget/recommand_item.dart';
import 'detailHouse.dart';
import 'filterPage.dart';

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
    var safearea = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 252),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: safearea,
            ),

            SizedBox(
              height: 60,
              width: env.size(context).width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Bonjour !",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(3, 100, 176, 65)
                      ),
                    ),
                  )
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Vous cherchez une maison?",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w100,
                    color: Color.fromARGB(143, 0, 0, 0)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<Datas>(
                builder: (context, datas, child){
                  try {
                    return GestureDetector(
                      onTap: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FilterPage(
                          allTextList: datas.all,
                          selectedUserList: [],
                        )),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                const Color.fromRGBO(213, 225, 243, 50),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Entrez les coordonnées ici ...",
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                  color: Color.fromARGB(143, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(3, 100, 176, 65),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    );
                  } catch(e){
                    return SizedBox();
                  }
                },
              )
            ),

            SizedBox(
              height: 60,
              width: env.size(context).width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Meilleures Maisons",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(143, 0, 0, 0)),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text("",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                              color: Color.fromARGB(143, 0, 0, 0)))),
                ],
              ),
            ),

            getFeature(),

            SizedBox(
              height: 60,
              width: env.size(context).width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Nouvelles offres",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(143, 0, 0, 0)),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text("",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                              color: Color.fromARGB(143, 0, 0, 0)))),
                ],
              ),
            ),

            getRecommend(),

            const SizedBox(
              height: 16.0
            )
          ],
        ),
      ),
    );
  }

  getFeature() {
    return Consumer<Datas>(
        builder: (context, datas, child){
          try{
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: datas.homeLocation.map((e){
                    return InkWell(
                      child: Hotels(
                          title: '${e.categories[0].name.toString().substring(0, 6)} ${e.detail.number_pieces} pièces',
                          image: 'http://karibukwako.com/storage/${e.images}',
                          location: '${e.address}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Details(
                            data: e,
                          )),
                        );
                      },
                    );
                  }).toList(),
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