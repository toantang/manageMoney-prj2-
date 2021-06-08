
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magane_money/string/string_used.dart';

class InformationTradeController extends GetxController {
  var _tapIndex = 0.obs;
  var _valueUpdate = ['nameTrade', 'nameGroupTrade', 'moneyTrade', 'nameTypeTrade', 'noteTrade', 'dateDelivery'].obs;
  TextEditingController _textEditingControllerUpdate = new TextEditingController();

  void getValueUpdate(int index, String title) {
    String value = this.textEditingControllerUpdate.text;
    if (index == 2) {
      if(value != '') {
        this.valueUpdate[index] = double.parse(value).toString();
      }
      else {
        this.valueUpdate[index] = title;
      }
    }
    else {
      if(value != '') {
        this.valueUpdate[index] = value;
      }
      else {
        this.valueUpdate[index] = title;
      }
    }

    print(this.valueUpdate[index]);
  }

  void setData(DocumentSnapshot documentSnapshot) {
    for (int index = 0; index < listKey.length; index++) {
      var s = documentSnapshot[listKey[index]];
      String title = 'title';

      if (s.runtimeType == Timestamp){
        title = DateFormat('dd/MM/yyyy').format(DateTime.parse(s.toDate().toString()));
      }
      else {
        title = s.toString();
      }

      this._valueUpdate[index] = title;
    }
  }

  get tapIndex => _tapIndex.value;

  set tapIndex(value) {
    _tapIndex.value = value;
  }

  get valueUpdate => _valueUpdate.value;

  set valueUpdate(value) {
    _valueUpdate.value = value;
  }

  TextEditingController get textEditingControllerUpdate =>
      _textEditingControllerUpdate;

  set textEditingControllerUpdate(TextEditingController value) {
    _textEditingControllerUpdate = value;
  }
}