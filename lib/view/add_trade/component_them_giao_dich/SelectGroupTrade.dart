import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Project%202/managemoney/lib/controller/viewController/trade_controller/addTradeController.dart';
import 'package:magane_money/other_things/other.dart';
import 'package:magane_money/color/color_used.dart';
import 'package:get/get.dart';


class SelectGroupTrade extends StatelessWidget {

  final AddTradeController addTradeController = Get.find();

  Widget selectGroupTradeButton(BuildContext context) {
    return ListTile(
      onTap: () async {
        addTradeController.pushToSelectTrade(context);
      },
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      leading: Obx(() {
        return Text(addTradeController.nameTrade, style: TextStyle(
          color: kDefaultBlack,
          fontSize: kDefaultFontSize,
        ),);
        }
      ),
    );
  }

  Widget setGroupMoney(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        children: [
          Icon(Icons.group_add_outlined, size: kDefaultIconSize,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: kDefaultPadding),
              child: Card(
                shape: StadiumBorder(
                  side: BorderSide(
                    color: kDefaultBlack,
                    width: 0.7,
                  ),
                ),
                child: selectGroupTradeButton(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return setGroupMoney(context);
  }
}