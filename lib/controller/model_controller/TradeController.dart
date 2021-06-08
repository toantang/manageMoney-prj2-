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

  Query getAllTrade() {
    return this._tradeCollection;
  }

  Query getTradeByType(bool typeTradeId) {
    return this._tradeCollection.where('typeTradeId', isEqualTo: typeTradeId);
  }

  Query getTradeByDateAndType(String nameTypeTrade, DateTime dateStart, DateTime dateEnd) {
    Query queryTrade = this._tradeCollection.where('nameTypeTrade', isEqualTo: nameTypeTrade);

    queryTrade = queryTrade
        .where('dateDelivery', isGreaterThanOrEqualTo: Timestamp.fromDate(dateStart))
        .where('dateDelivery', isLessThanOrEqualTo: Timestamp.fromDate(dateEnd));

    return queryTrade;
  }
}