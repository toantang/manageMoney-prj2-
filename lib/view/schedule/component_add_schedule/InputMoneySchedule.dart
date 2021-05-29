import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/controller/viewController/AddScheduleController.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:magane_money/other_things/other.dart';
import 'package:get/get.dart';

class InputMoneySchedule extends StatelessWidget {


  final AddScheduleController addScheduleController = Get.find();

  Widget inputMoneySchedule(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
        //currentFocus.requestFocus();
      },
      child: Container(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Row(
          children: [
            Icon(Icons.group, size: kDefaultIconSize,),
            Container(
              padding: EdgeInsets.only(left: kDefaultPadding),
              width: 370,
              child: TextFormField(
                controller: addScheduleController.textEditingControllerMoneyForSchedule,
                style: TextStyle(fontSize: kDefaultFontSize),
                keyboardType: TextInputType.numberWithOptions(decimal: true,),
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: kDefaultInputMoneySchedule,
                    suffixText: kSuffixTextInputMoney,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(kDefaultBorderRadius)),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //FocusScopeNode currentFocus = new FocusScopeNode();
    return inputMoneySchedule(context);
  }
}