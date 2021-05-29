import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class AddScheduleController extends GetxController {
  var _nameSchedule = 'nameSchedule'.obs;
  var _moneyForSchedule = 0.0.obs;
  var _dateStartSchedule = DateTime.now().obs;
  var _interval = 0.0.obs;
  var _note = "note schedule".obs;
  var _stateSchedule = false.obs;
  var _progessSchedule = 0.0.obs;

  var _indexSelectTimeUnit = 0.obs;
  TextEditingController _textEditingControllerMoneyForSchedule = new TextEditingController();
  TextEditingController _textEditingControllerNameSchedule = new TextEditingController();
  TextEditingController _textEditingControllerNoteSchedule = new TextEditingController();
  TextEditingController _textEditingControllerIntervalSchedule = new TextEditingController();

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

  void getMoney() {
    if (this.textEditingControllerMoneyForSchedule.text == '') {
      this.moneyForSchedule = 0;
    }
    else {
      this.moneyForSchedule = double.parse(this.textEditingControllerMoneyForSchedule.text);
    }
  }

  void getNameSchedule() {
    if (this.textEditingControllerNameSchedule.text == '') {
      this.nameSchedule = '';
    }
    else {
      this.nameSchedule = this.textEditingControllerNameSchedule.text;
    }
  }

  void getNoteSchedule() {
    if (this.textEditingControllerNoteSchedule.text == '') {
      this.note = '';
    }
    else {
      this.note = this.textEditingControllerNoteSchedule.text;
    }
  }

  void getIntervalSchedule() {
    if (this.textEditingControllerIntervalSchedule.text == '') {
      this.interval = 0;
    }
    else {
      this.interval = int.parse(this.textEditingControllerIntervalSchedule.text);
    }
  }

  int checkNameSchedule() {
    if (this.nameSchedule.length >= 100) {
      return 0;
    }
    else if(this.nameSchedule.length <= 0) {
      return -1;
    }
    return 1;
  }

  int checkMoneySchedule() {
    String moneyString = this.moneyForSchedule.toString();
    List<String> moneyStringList = moneyString.split('.');

    if (this.moneyForSchedule == 0) {
      return 0;
    }
    if (this.moneyForSchedule >= pow(10, 6)) {
      return -1;
    }
    else if(this.moneyForSchedule <= 0) {
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

  int checkInterval(BuildContext context) {
    if (this.interval <= 0) {
      return 0;
    }
    else {
      if (this.indexSelectTimeUnit == 0) {
        if (this.interval > 20) {
          return -1;
        }
      }
      else if (this.indexSelectTimeUnit == 1) {
        if (this.interval > 240) {
          return -1;
        }
      }
      else {
        if (this.interval > 87840) {
          return -1;
        }
      }
    }

    return 1;
  }

  int checkInputNote() {
    if (this.note.length > 100) {
      return 0;
    }
    return 1;
  }


  get indexSelectTimeUnit => _indexSelectTimeUnit.value;

  set indexSelectTimeUnit(value) {
    _indexSelectTimeUnit.value = value;
  }

  get nameSchedule => _nameSchedule.value;

  set nameSchedule(value) {
    _nameSchedule.value = value;
  }

  get moneyForSchedule => _moneyForSchedule.value;

  set moneyForSchedule(value) {
    _moneyForSchedule.value = value;
  }


  TextEditingController get textEditingControllerIntervalSchedule =>
      _textEditingControllerIntervalSchedule;

  set textEditingControllerIntervalSchedule(TextEditingController value) {
    _textEditingControllerIntervalSchedule = value;
  }

  TextEditingController get textEditingControllerNoteSchedule =>
      _textEditingControllerNoteSchedule;

  set textEditingControllerNoteSchedule(TextEditingController value) {
    _textEditingControllerNoteSchedule = value;
  }

  TextEditingController get textEditingControllerNameSchedule =>
      _textEditingControllerNameSchedule;

  set textEditingControllerNameSchedule(TextEditingController value) {
    _textEditingControllerNameSchedule = value;
  }

  TextEditingController get textEditingControllerMoneyForSchedule =>
      _textEditingControllerMoneyForSchedule;

  set textEditingControllerMoneyForSchedule(TextEditingController value) {
    _textEditingControllerMoneyForSchedule = value;
  }

  get progessSchedule => _progessSchedule.value;

  set progessSchedule(value) {
    _progessSchedule.value = value;
  }

  get stateSchedule => _stateSchedule.value;

  set stateSchedule(value) {
    _stateSchedule.value = value;
  }

  get note => _note.value;

  set note(value) {
    _note.value = value;
  }

  get interval => _interval.value;

  set interval(value) {
    _interval.value = value;
  }

  get dateStartSchedule => _dateStartSchedule.value;

  set dateStartSchedule(value) {
    _dateStartSchedule.value = value;
  }
}