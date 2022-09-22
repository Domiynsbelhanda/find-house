import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:karibukwako/models/HomeLocation.dart';


import '../widget/recommand_item.dart';
import 'detailHouse.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key, this.allTextList, this.selectedUserList})
      : super(key: key);
  final List<HomeLocation>? allTextList;
  final List<HomeLocation>? selectedUserList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Rechercher une maison"),
      ),
      body: SafeArea(
        child: FilterListWidget<HomeLocation>(
          themeData: FilterListThemeData(context),
          hideSelectedTextCount: true,
          listData: this.allTextList,
          selectedListData: selectedUserList,
          choiceChipLabel: (item) {
            /// Used to print text on chip
            return item!.address;
          },
          choiceChipBuilder: (context, item, isSelected) {
            return Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 16.0, bottom: 16.0),
              child: RecommendItem(
                data: item,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Details(
                      data: item,
                    )),
                  );
                },
              ),
            );
          },
          validateSelectedItem: (list, val) {
            return list!.contains(val);
          },
          onItemSearch: (user, query) {
            bool val = user.prices.toString().toLowerCase().contains(query.toLowerCase())
                || user.town.toLowerCase().contains(query.toLowerCase())
                || user.detail.number_pieces.toString().contains(query)
            ;
            return val;
          },
        ),
      ),
    );
  }
}