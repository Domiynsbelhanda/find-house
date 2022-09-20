import 'package:flutter/material.dart';
import 'package:karibukwako/models/HomeLocation.dart';
import '../utils/color.dart';
import 'custom_image.dart';

class RecommendItem extends StatelessWidget {
  RecommendItem({Key? key, required this.data, this.onTap}) : super(key: key);
  final HomeLocation data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(10),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              CustomImage(
                'https://www.karibukwako.com/storage/${data.images}',
                radius: 15,
                fit: BoxFit.cover,
                height: 120,
                width: 120,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data.detail.number_pieces} pièces',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.town,
                      style: TextStyle(fontSize: 12, color: labelColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${data.categories[0].name}',
                      style: TextStyle(fontSize: 12, color: labelColor),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [

                        Expanded(
                          child: Text(
                            '${data.warranty_price} de garantie',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Text(
                          '${data.prices} \$',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
