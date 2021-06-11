import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:magane_money/controller/model_controller/TradeController.dart';
import 'package:magane_money/string/string_used.dart';
class StatisticController extends GetxController {
  var _typeTradeid = false.obs;
  var _idView = 0.obs;
  Query getData(int idView, TradeController tradeController) {
    if (idView == 1) {
      return tradeController.getTradeByTypeAndNameType(this.typeTradeid, listTypeTrade[0]);
    }
    else if (idView == 2) {
      return tradeController.getTradeByTypeAndNameType(this.typeTradeid, listTypeTrade[1]);
    }
    else if (idView == 3) {
      return tradeController.getTradeByTypeAndNameType(this.typeTradeid, listTypeTrade[2]);
    }
    else if (idView == 4) {
      return tradeController.getTradeByTypeAndNameType(this.typeTradeid, listTypeTrade[3]);
    }
    return null;
  }

  get typeTradeid => _typeTradeid.value;

  set typeTradeid(value) {
    _typeTradeid.value = value;
  }
}