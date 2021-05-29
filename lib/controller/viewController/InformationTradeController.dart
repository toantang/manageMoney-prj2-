
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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