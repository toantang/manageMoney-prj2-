import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:magane_money/string/string_used.dart';

class ExAndTurnoverController extends GetxController {
  var _percentExpenditure = 0.0.obs;
  var _sumMoneyExpenditure = 0.0.obs;
  var _sumMoneyTurnover = 0.0.obs;

  void countPercentExpenditure(QuerySnapshot querySnapshot) {
    int leng = querySnapshot.size;
    this.sumMoneyTurnover = 0.0;
    this.sumMoneyExpenditure = 0.0;
    for (int i = 0; i < leng; i++) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[i];
      double moneyTrade = documentSnapshot[listKey[2]];
      if (documentSnapshot['typeTradeId'] == true) {
        this.sumMoneyTurnover += moneyTrade;
      }
      else {
        this.sumMoneyExpenditure += moneyTrade;
      }
    }

    this.percentExpenditure = this.sumMoneyExpenditure/(this.sumMoneyExpenditure + this.sumMoneyTurnover);
    this.percentExpenditure = num.parse(this.percentExpenditure.toStringAsFixed(2));
  }

  get sumMoneyTurnover => _sumMoneyTurnover.value;

  set sumMoneyTurnover(value) {
    _sumMoneyTurnover.value = value;
  }

  get sumMoneyExpenditure => _sumMoneyExpenditure.value;

  set sumMoneyExpenditure(value) {
    _sumMoneyExpenditure.value = value;
  }

  get percentExpenditure => _percentExpenditure.value;

  set percentExpenditure(value) {
    _percentExpenditure.value = value;
  }
}