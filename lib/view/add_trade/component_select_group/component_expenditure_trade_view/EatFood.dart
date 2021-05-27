import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DataModel.dart';

class EatFood extends StatelessWidget {

  List<BaseData> getEatFood() {
    return [
      DataModel(
        id: 1,
        name: 'Root',
        parentId: -1,
        extra: {'key': 'extradata1'},
      ),
      DataModel(
        id: 2,
        name: 'Eat & Coffe',
        parentId: 1,
        extra: {'key': 'Eat & Coffe'},
      ),
      DataModel(
        id: 3,
        name: 'Eat',
        parentId: 2,
        extra: {'key': 'Eat & Coffe'},
      ),
      DataModel(
        id: 4,
        name: 'Coffee',
        parentId: 2,
        extra: {'key': 'Eat & Coffe'},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: DynamicTreeView(
        data: getEatFood(),
        config: Config(
            parentTextStyle: TextStyle(fontWeight: FontWeight.w600),
            childrenTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            arrowIcon: Icon(Icons.fastfood, color: Colors.deepOrange,),
            rootId: "1",
            parentPaddingEdgeInsets: EdgeInsets.only(left: 16, top: 0, bottom: 0)),
        onTap: (m) {
          String s = m['title'];
          Map<String, String> data = {'name': s, 'nameGroupTrade': 'Eat & Coffe', 'frequency': '0'};
          Navigator.pop(context, data);
        },
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}