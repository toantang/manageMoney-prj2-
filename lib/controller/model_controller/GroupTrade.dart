import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magane_money/controller/model_controller/TypeTradeController.dart';
import 'package:magane_money/model/GroupTrade.dart';

class GroupTradeController extends TypeTradeController {
  String _idGroupTrade = 'null';

  Future<void> insertGroupTrade(GroupTrade groupTrade) async {
    print('idTypeTradeDocument = $idTypeTradeDocument');
    final CollectionReference groupTradeCollection = FirebaseFirestore.instance
        .collection('TypeTrade')
        .doc(idTypeTradeDocument)
        .collection('GroupTrade');
    groupTradeCollection.add(groupTrade.toMap()).then((value) => this._idGroupTrade = value.id);
  }

  Future<void> updateGroupTrade(GroupTrade groupTrade,  String idTypeTradeDocument, String id) async {
    final CollectionReference groupTradeCollection = FirebaseFirestore.instance
        .collection('TypeTrade')
        .doc(idTypeTradeDocument)
        .collection('GroupTrade');
    groupTradeCollection.doc(id.toString()).update(groupTrade.toMap());
  }

  Future<void> deleteGroupTrade(int id, String idTypeTradeDocument) async {
    final CollectionReference groupTradeCollection = FirebaseFirestore.instance
        .collection('TypeTrade')
        .doc(idTypeTradeDocument)
        .collection('GroupTrade');

    groupTradeCollection.doc(id.toString()).delete();
  }

  String get idGroupTrade => _idGroupTrade;

  set idGroupTrade(String value) {
    _idGroupTrade = value;
  }
}