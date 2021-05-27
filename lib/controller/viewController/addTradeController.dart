import 'dart:math';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magane_money/controller/model_controller/GroupTrade.dart';
import 'package:magane_money/controller/model_controller/TradeController.dart';
import 'package:magane_money/controller/model_controller/TypeTradeController.dart';
import 'package:magane_money/model/GroupTrade.dart';
import 'package:magane_money/model/Trade.dart';
import 'package:magane_money/model/TypeTrade.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:magane_money/view/add_trade/component_select_group/ExpenditureFixedTradeView.dart';
import 'package:magane_money/view/add_trade/component_select_group/ExpenditureTradeView.dart';

import 'package:magane_money/view/add_trade/component_select_group/TurnoverFixedTradeView.dart';
import 'package:magane_money/view/add_trade/component_select_group/TurnoverTradeView.dart';

class AddTradeController extends GetxController {
  var _dataFromGroupTrade; // nhận tên giao dịch dc gửi từ view GroupTrade
  var _nameTrade = 'Select Trade'.obs; // tên giao dịch
  var _nameGroupTrade = "nameGroupTrade".obs;
  var _moneyTrade = 0.0.obs;
  var _date = DateTime.now().obs;
  var _note = "no note".obs;
  var _indexDropdownSelectTypeTrade = 0.obs; // được sử dụng trong class SelectTypeTrade

  TextEditingController _textEditingControllerMoney = new TextEditingController();
  TextEditingController _textEditingControllerNote = new TextEditingController();

  final List<Widget> list = [ExpenditureFixedTradeView(), ExpenditureTradeView(), TurnoverFixedTradeView(), TurnoverTradeView(),];

  TypeTrade _typeTrade = new TypeTrade();
  GroupTrade _groupTrade = new GroupTrade();
  Trade _trade = new Trade();
  TypeTradeController typeTradeController = new TypeTradeController();
  GroupTradeController groupTradeController = new GroupTradeController();
  TradeController tradeController = new TradeController();


  void nameTradeSelected(Map<String, String> data) {
    this._nameTrade.value = data['name'];
  }

  void nameGroupTradeSelected(Map<String, String> data) {
    this._nameGroupTrade.value = data['nameGroupTrade'];
  }

  void getMoney(BuildContext context) {
    String s = this._textEditingControllerMoney.text;
    if (s == null) {
      showFlushbarError(context, 'inputmoney is null');
    }
    else {
      this.moneyTrade = double.parse(s);
    }
  }

  void getNote() {
    this.note = this._textEditingControllerNote.text;
  }
  void dateTradeSelected(DateTime date) {
    this._date.value = date;
  }

  void changeIndexDropdownSelectTypeTrade(String val) {
    int count = -1;
    for (int i = 0; i < listTypeTrade.length; i++) {
      if (listTypeTrade[i] == val) {
        count = i;
        break;
      }
    }
    this._indexDropdownSelectTypeTrade.value = count;
    this._nameTrade.value = "Select Trade";
  }

  void pushToSelectTrade(BuildContext context) async {
    this.dataFromGroupTrade = await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return list[this.indexDropdownSelectTypeTrade];
        }
    )
    );

    nameTradeSelected(this.dataFromGroupTrade);
    nameGroupTradeSelected(this.dataFromGroupTrade);
  }

  int checkInputMoney() {
    String moneyString = this.moneyTrade.toString();
    List<String> moneyStringList = moneyString.split('.');

    if (this.moneyTrade == 0) {
      return 0;
    }
    if (this.moneyTrade >= pow(10, 6)) {
      return -1;
    }
    else if(this.moneyTrade <= 0) {
      return -2;
    }
    else if (moneyStringList.length == 2) {
      if (moneyStringList[1].length > 2) {
        return -3;
      }
      if (moneyStringList[0].length > 6) {
        return -4;
      }
    }
    else if (moneyString.length > 9) {
      return -5;
    }
    return 1;
  }

  int checkInputNote() {
    if (this.note.length > 100) {
      return 0;
    }
    return 1;
  }

  void showFlushbarError(BuildContext context, String noti) async {
    final flushbarEmailnotRight = Flushbar(
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('NOTIFICATION',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text("$noti", style: TextStyle(color: Colors.lightBlue[50])),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      isDismissible: true,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      backgroundColor: Colors.blueGrey[700],
      leftBarIndicatorColor: Colors.red,
    );
    flushbarEmailnotRight.show(context);
  }

  void checkAndInsertTrade(BuildContext context) {
    int x = checkInputMoney();
    int y = checkInputNote();
    if (x < 1) {
      showFlushbarError(context, listErrorInputMoney[x.abs()]);
    }
    else if(y < 1) {
      showFlushbarError(context, listErrorInputNote[y.obs()]);
    }

    else {
      this._trade.nameTrade = this.nameTrade;
      this._trade.moneyTrade = this.moneyTrade;
      this._trade.dateDelivery = this.date;
      this._trade.note = this.note;

      this._typeTrade.typeTrade = false;
      this._typeTrade.nameTypeTrade = 'chi tieu';
      this._typeTrade.userId = 1;

      this._groupTrade.nameGroupTrade = this.nameGroupTrade;


      typeTradeController.insertTypeTrade(this._typeTrade);
      groupTradeController.insertGroupTrade(this._groupTrade);
      tradeController.insertTransaction(this._trade, typeTradeController.idTypeTradeDocument, groupTradeController.idGroupTrade);

      print("luu thanh cong");
    }
  }


  TextEditingController get textEditingControllerMoney =>
      _textEditingControllerMoney;

  set textEditingControllerMoney(TextEditingController value) {
    _textEditingControllerMoney = value;
  }

  get nameGroupTrade => _nameGroupTrade.value;

  set nameGroupTrade(value) {
    _nameGroupTrade.value = value;
  }

  get nameTrade => _nameTrade.value;

  set nameTrade(String value) {
    _nameTrade.value = value;
  }

  get dataFromGroupTrade => _dataFromGroupTrade;

  set dataFromGroupTrade(value) {
    _dataFromGroupTrade = value;
  }

  get moneyTrade => _moneyTrade.value;

  set moneyTrade(value) {
    _moneyTrade.value = value;
  }

  get date => _date.value;

  set date(value) {
    _date.value = value;
  }

  get note => _note.value;

  set note(value) {
    _note.value = value;
  }

  get indexDropdownSelectTypeTrade => _indexDropdownSelectTypeTrade.value;

  set indexDropdownSelectTypeTrade(value) {
    _indexDropdownSelectTypeTrade.value = value;
  }

  TextEditingController get textEditingControllerNote =>
      _textEditingControllerNote;

  set textEditingControllerNote(TextEditingController value) {
    _textEditingControllerNote = value;
  }
}