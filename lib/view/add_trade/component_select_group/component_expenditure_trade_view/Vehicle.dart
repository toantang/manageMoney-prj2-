import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DataModel.dart';

class Vehicle extends StatelessWidget {
  List<BaseData> getVehicle() {
    return [
      DataModel(
        id: 1,
        name: 'Root',
        parentId: -1,
        extra: {'key': 'Vehicle'},
      ),
      DataModel(
        id: 2,
        name: 'Vehicle',
        parentId: 1,
        extra: {'key': 'Vehicle2'},
      ),
      DataModel(
        id: 3,
        name: 'petrol',
        parentId: 2,
        extra: {'key': 'petrol3'},
      ),
      DataModel(
        id: 4,
        name: 'Grab/Uber/Gojek',
        parentId: 2,
        extra: {'key': 'Grab/Uber/Gojek4'},
      ),
      DataModel(
        id: 5,
        name: 'Maintain',
        parentId: 2,
        extra: {'key': 'Maintain5'},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DynamicTreeView(
      data: getVehicle(),
      config: Config(
          parentTextStyle: TextStyle(fontWeight: FontWeight.w600),
          childrenTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          arrowIcon: Icon(Icons.time_to_leave, color: Colors.black54,),
          rootId: "1",
          parentPaddingEdgeInsets:
          EdgeInsets.only(left: 16, top: 0, bottom: 0)),
      onTap: (m) {
        String s = m['title'];
        Map<String, String> data = {'name': s, 'nameGroupTrade': 'Vehicle', 'frequency': '0'};
        Navigator.pop(context, data);
      },
      width: MediaQuery.of(context).size.width,
    );
    throw UnimplementedError();
  }
}