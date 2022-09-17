import 'package:flutter/material.dart';
import 'package:karibukwako/models/slider.dart';

import '../utils/env.dart';

class ItemCaroussel extends StatelessWidget{
  Sliders data;
  BuildContext context;

  ItemCaroussel({required this.data, required this.context});

  Env env = new Env();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: env.size(context).width * 0.8,
      height: (env.size(context).height * 0.5) - 96,
      margin: EdgeInsets.only(left: 16.0),
      child: Stack(
        children: [
          Container(
            height: (env.size(context).height * 0.5) - 96,
            width: env.size(context).width,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(16.0),
              // image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: NetworkImage(
              //         ''
              //     )
              // ),
            ),
          ),
          Container(
            height: (env.size(context).height * 0.5) - 96,
            width: env.size(context).width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.black.withOpacity(.5),
                    ],
                    stops: [
                      0.0,
                      1.0
                    ]
                )
            ),
          ),

          Positioned(
            bottom: 0.0,
            child: Container(
              height: (env.size(context).height * 0.5) - 96,
              width: env.size(context).width,
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${data.title}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: env.size(context).width / 20
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}