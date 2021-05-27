import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magane_money/model/UserName.dart';

class UserNameController {
  final CollectionReference userNameCollection = FirebaseFirestore.instance.collection('UserName');
  Future<void> insertUserName(UserName userName) async {
    userNameCollection.add(userName.toMap());
  }

  Future<void> updateUserName(UserName userName, int id) async {
    userNameCollection.doc(id.toString()).update(userName.toMap());
  }
}