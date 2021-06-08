import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/color/color_used.dart';
import 'file:///D:/Project%202/managemoney/lib/controller/viewController/trade_controller/addTradeController.dart';
import 'package:magane_money/other_things/other.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:magane_money/view/add_trade/component_them_giao_dich/InputNote.dart';

import 'component_them_giao_dich/InputMoney.dart';
import 'component_them_giao_dich/SelectDate.dart';
import 'component_them_giao_dich/SelectGroupTrade.dart';
import 'component_them_giao_dich/SelectTypeTrade.dart';
import 'package:get/get.dart';
class AddTrade extends StatelessWidget {

  final AddTradeController addTradeController = Get.put((AddTradeController()));

  Widget saveButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      width: 110,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          addTradeController.getNameTypeTrade(context);
          addTradeController.changeTypeTradeId();
          addTradeController.getMoney(context);
          addTradeController.getNote();
          addTradeController.checkAndInsertTrade(context);
        },
        child: Row(
          children: [
            Icon(Icons.save, size: kDefaultIconSize,),
            Container(padding: EdgeInsets.only(left: 10),),
            Text(save),
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.black45;
                  }
                  else {
                    return kDefaultLightGreen600;
                  }
                }
            )
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              InputMoney(),
              SelectTypeTrade(),
              SelectGroupTrade(),
              SelectDate(),
              Note(),
              saveButton(context),
            ],
          ),
        ],
      ),
    );
  }
}