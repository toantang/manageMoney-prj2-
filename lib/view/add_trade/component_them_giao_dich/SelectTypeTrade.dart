import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/color/color_used.dart';
import 'package:magane_money/controller/viewController/addTradeController.dart';
import 'package:magane_money/other_things/other.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:get/get.dart';

class SelectTypeTrade extends StatelessWidget {

  final AddTradeController addTradeController = Get.find();

  Widget columnSelect(BuildContext context, String value) {
    return Column(
      children: [
        Divider(
          height: 2.5,
          color: kDefaultBlack,
        ),
        Padding(
            child: Text(value, style: TextStyle(fontSize: kDefaultFontSize),),
            padding: EdgeInsets.only(top: 10)
        ),
      ],
    );
  }

  Widget makeDropDownButton(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Obx(() {
          return DropdownButton(
            value: listTypeTrade[addTradeController.indexDropdownSelectTypeTrade],
            items: listTypeTrade.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: columnSelect(context, value),
              );
            }).toList(),
            onChanged: (String val) async {
              addTradeController.changeIndexDropdownSelectTypeTrade(val);
              addTradeController.pushToSelectTrade(context);
            },
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: kDefaultDeepPurple, fontSize: 30,),
            underline: Container(height: 2, color: kDefaultDeepPurpleAccent,),
          );
        }),
      );
  }

  @override
  Widget build(BuildContext context) {
    return makeDropDownButton(context);
  }
}