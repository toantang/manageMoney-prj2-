import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magane_money/model/User.dart';

class UserController {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('User');
  Future<void> insertUser(User user) async {
    userCollection.add(user);
  }

  Future<void> updateUser(User user, String id) async {
    userCollection.doc(id).update(user.toMap());
  }

  Future<void> deleteUser(String id) async {
    userCollection.doc(id).delete();
  }
}