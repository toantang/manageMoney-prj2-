import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magane_money/model/User.dart';

class UserController {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('User');
  Future<void> insertUser(User user) {
    userCollection.add(user);
  }

  Future<void> updateUser(User user, int id) async {
    userCollection.doc(id.toString()).update(user.toMap());
  }

  Future<void> deleteUser(int id) async {
    userCollection.doc(id.toString()).delete();
  }
}