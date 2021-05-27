import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magane_money/model/Name.dart';

class NameController {
  final CollectionReference nameCollection = FirebaseFirestore.instance.collection('Name');

  Future<void> insertNameUser(Name name) {
    nameCollection.add(name.toMap());
  }

  Future<void> updateNameUser(Name name, int id) {
    nameCollection.doc(id.toString()).update(name.toMap());
  }


}