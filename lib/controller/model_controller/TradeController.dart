import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magane_money/model/Trade.dart';

class TradeController {

  final CollectionReference _tradeCollection = FirebaseFirestore.instance.collection('Trade');

  Future<DocumentReference> insertTrade(Trade trade) async {
    DocumentReference documentReference = await this._tradeCollection.add(trade.toMap());
    return documentReference;
  }

  Future<void> updateTrade(String id, Trade trade) async {
    this._tradeCollection.doc(id.toString()).update(trade.toMap());
  }

  Future<void> deleteTrade(int id, String idTypeTrade, String idGroupTrade) async {
    this._tradeCollection.doc(id.toString()).delete();
  }
}