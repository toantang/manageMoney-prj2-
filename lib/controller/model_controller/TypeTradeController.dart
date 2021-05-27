import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magane_money/model/TypeTrade.dart';

class TypeTradeController {
  final CollectionReference _typeTradeCollection = FirebaseFirestore.instance.collection('TypeTrade');
  String _idTypeTradeDocument = 'null';
  Future<void> insertTypeTrade(TypeTrade typeTrade) async {
    this._typeTradeCollection.add(typeTrade.toMap()).then((value) {
      print(value.id);
      this._idTypeTradeDocument = value.id;
      print(this.idTypeTradeDocument);
      return this.idTypeTradeDocument;
    });
  }

  Future<void> updateTypeTrade(TypeTrade typeTrade, int id) async {
    this._typeTradeCollection.doc(id.toString()).update(typeTrade.toMap());
  }

  Future<void> deleteTypeTrade(int id) async {
    this._typeTradeCollection.doc(id.toString()).delete();
  }

  String get idTypeTradeDocument => _idTypeTradeDocument;

  set idTypeTradeDocument(String value) {
    _idTypeTradeDocument = value;
  }
}