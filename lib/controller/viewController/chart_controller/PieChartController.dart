import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:magane_money/string/string_used.dart';

class PieChartController extends GetxController {
  var _touchedIndex = 0.obs;
  var _listValue = [0.0, 0.0].obs;
  var _listPercent = [0.0, 0.0].obs;
  
  void getPercent(List<DocumentSnapshot> documentSnapshotList, bool typeTradeId) {
    double sumMoney = 0;
    this.listValue = [0.0, 0.0];
    this.listPercent = [0.0, 0.0];
    int lenQuery = documentSnapshotList.length;
    
    for (int i = 0; i < lenQuery; i++) {
      String nameTypeTrade = documentSnapshotList[i]['nameTypeTrade'];
      double moneyTrade = documentSnapshotList[i]['moneyTrade'];
      if (typeTradeId == false) {
        //if nameTypeTrade == listTypeTrade[0] = khoản chi cố định

        if (nameTypeTrade == listTypeTrade[0]) {
          this.listValue[0] += moneyTrade;
        }
        else {
          this.listValue[1] += moneyTrade;
        }
      }
      else {
        if (nameTypeTrade == listTypeTrade[2]) {
          this.listValue[0] += moneyTrade;
        }
        else {
          this.listValue[1] += moneyTrade;
        }
      }

      sumMoney += moneyTrade;
    }
    
    this.listValue.sort();
    while(listValue[0] == 0) {
      this.listValue.removeAt(0);
    }
    
    double x = this.listValue[0]*100/sumMoney;
    this.listPercent[0] = num.parse(x.toStringAsFixed(2));
    this.listPercent[1] = 100 - this.listPercent[0];
  }

  get listPercent => _listPercent.value;

  set listPercent(value) {
    _listPercent.value = value;
  }

  get touchedIndex => _touchedIndex.value;

  set touchedIndex(value) {
    _touchedIndex.value = value;
  }

  get listValue => _listValue.value;

  set listValue(value) {
    _listValue.value = value;
  }
}