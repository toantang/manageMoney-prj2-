import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/controller/viewController/addTradeController.dart';
import 'package:magane_money/other_things/other.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:get/get.dart';

class Note extends StatelessWidget {

  AddTradeController addTradeController = Get.find();
  Widget setNote(BuildContext context, FocusScopeNode currentFocus) {
    return GestureDetector(
      onTap: () {
        currentFocus.requestFocus();
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Row(
          children: [
            Icon(Icons.note_add, size: kDefaultIconSize,),
            Container(
              padding: EdgeInsets.only(left: kDefaultPadding),
              width: 370,
              child: TextFormField(
                controller: this.addTradeController.textEditingControllerNote,

                style: TextStyle(fontSize: kDefaultFontSize - 2),
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: kDefaultNote,
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
    FocusScopeNode currentFocus = new FocusScopeNode();
    return setNote(context, currentFocus);
  }
}