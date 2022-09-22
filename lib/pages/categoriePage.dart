import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/HomeLocation.dart';
import '../services/datas.dart';
import '../utils/color.dart';
import '../widget/recommand_item.dart';
import 'detailHouse.dart';

class ListItem extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListItem();
  }
}

class _ListItem extends State<ListItem>{

  late List<HomeLocation> rooms;
  List<HomeLocation>? selectedUserList;

  Future<void> _openFilterDialog(userList) async {
    await FilterListDialog.display<HomeLocation>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(context),
      headlineText: 'Choisir une maison',
      height: 500,
      listData: userList,
      selectedListData: userList,
      choiceChipLabel: (item) => item!.detail.number_pieces.toString(),
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ControlButtonType.All, ControlButtonType.Reset],
      onItemSearch: (user, query) {
        bool val = user.prices.toString().toLowerCase().contains(query.toLowerCase())
            || user.town.toLowerCase().contains(query.toLowerCase())
            || user.detail.number_pieces.toString().contains(query)
        ;
        return val;
      },

      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
        });
        Navigator.pop(context);
      },

      choiceChipBuilder: (context, item, isSelected) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
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
    );
  }

  @override
  void initState() {
    rooms = Provider.of<Datas>(context, listen: false).all;
  }

  @override
  Widget build(BuildContext context) {
    rooms = Provider.of<Datas>(context, listen: false).all;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Maison',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),

                Consumer<Datas>(
                    builder: (context, datas, child){
                      return TextButton(
                        onPressed: ()=>_openFilterDialog(datas.all),
                        child: const Text(
                          "Filtrer",
                          style: TextStyle(color: Colors.grey),
                        ),
                        // color: Colors.blue,
                      );
                    })
              ],
            ),
          ),
          (rooms.length != 0) ?
          Expanded(
            child: ListView.builder(
              itemCount: rooms.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
                  child: RecommendItem(
                    data: rooms[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Details(
                          data: rooms[index],
                        )),
                      );
                    },
                  ),
                );
              },
            ),
          ) :
          Consumer<Datas>(
              builder: (context, datas, child){
                try{
                  return Expanded(
                    child: ListView.builder(
                      itemCount: datas.all.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: RecommendItem(
                            data: datas.all[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Details(
                                  data: datas.all[index],
                                )),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                } catch(e){
                  return SizedBox();
                }
              }
          )
        ],
      ),
    );
  }
}