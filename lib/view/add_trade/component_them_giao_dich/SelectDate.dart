import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/controller/viewController/addTradeController.dart';
import 'package:get/get.dart';
import 'package:magane_money/other_things/other.dart';
import 'package:magane_money/color/color_used.dart';

import '../../../table_calendar.dart';
import 'package:intl/intl.dart';

class SelectDate extends StatelessWidget {

  final AddTradeController addTradeController = Get.find();

  void _awaitReturnValueFromCalendar(BuildContext context) async {
    addTradeController.date = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Calendar(),
        ));

  }

  Widget selectDate(BuildContext context) {
    return Container(
      child: ListTile(
        /*shape: StadiumBorder(
          side: BorderSide(color: Colors.black, width: 0.7,),
        ),*/
        leading: Obx(() {
          return Text(
            DateFormat('dd/MM/yyyy').format(addTradeController.date),
            style: TextStyle(
              color: kDefaultBlack,
              fontSize: kDefaultFontSize,
            ),);
        }),
        onTap: () {
          _awaitReturnValueFromCalendar(context);
        },
      ),
    );
  }

  Widget setDate(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        children: [
          Icon(Icons.date_range, color: kDefaultDeepPurpleAccent, size: kDefaultIconSize,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: kDefaultPadding),
              child: Card(
                shape: StadiumBorder(
                  side: BorderSide(color: kDefaultGrey400,),
                ),
                //shadowColor: kDefaultDeepPurpleAccent400,
                child: selectDate(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return setDate(context);
  }
}