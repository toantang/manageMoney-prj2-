import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magane_money/model/Trade.dart';

class TradeController {


  Future<void> insertTransaction(Trade trade, String idTypeTrade, String idGroupTrade) async {
    final CollectionReference tradeCollection = FirebaseFirestore.instance
        .collection('TypeTrade')
        .doc(idTypeTrade)
        .collection('groupTrade')
        .doc(idGroupTrade)
        .collection('Trade');

    tradeCollection.add(trade.toMap());
  }

  Future<void> updateTrade(Trade trade, int id, String idTypeTrade, String idGroupTrade) async {
    final CollectionReference tradeCollection = FirebaseFirestore.instance
        .collection('TypeTrade')
        .doc(idTypeTrade)
        .collection('groupTrade')
        .doc(idGroupTrade)
        .collection('Trade');
    tradeCollection.doc(id.toString()).update(trade.toMap());
  }

  Future<void> deleteTrade(int id, String idTypeTrade, String idGroupTrade) async {
    final CollectionReference tradeCollection = FirebaseFirestore.instance
        .collection('TypeTrade')
        .doc(idTypeTrade)
        .collection('groupTrade')
        .doc(idGroupTrade)
        .collection('Trade');
    tradeCollection.doc(id.toString()).delete();
  }
}