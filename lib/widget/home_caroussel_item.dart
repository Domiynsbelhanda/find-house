import 'package:flutter/material.dart';
import 'package:karibukwako/models/slider.dart';

import '../utils/env.dart';

class ItemCaroussel extends StatelessWidget{
  Sliders data;
  BuildContext context;

  ItemCaroussel({Key? key, required this.data, required this.context}) : super(key: key);

  Env env = Env();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: env.size(context).width * 0.8,
      height: (env.size(context).height * 0.5) - 96,
      margin: const EdgeInsets.only(left: 16.0),
      child: Stack(
        children: [
          Container(
            height: (env.size(context).height * 0.5) - 96,
            width: env.size(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.karibukwako.com/storage/${data.images}'
                  )
              ),
            ),
          ),
          Container(
            height: (env.size(context).height * 0.5) - 96,
            width: env.size(context).width,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.black.withOpacity(1.0),
                    ],
                    stops: const [
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
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: (env.size(context).width * 0.8) - 16 ,
                        child: Text(
                          data.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: env.size(context).width / 20
                          ),
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