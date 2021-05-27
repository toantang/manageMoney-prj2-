import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AccountInformation extends StatelessWidget {

  Future<void> init() async {
    await Firebase.initializeApp();
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot documentSnapshot) {
    return ListTile(
      title: Text(documentSnapshot['firstName'].toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final test = FirebaseFirestore.instance.collectionGroup('Name').snapshots();

    return Scaffold(
      body: StreamBuilder(
        stream: test,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {

            print(snapshot.data);
            return Center(child: Text('Loading...'),);
          }
          else {
            //final getName = FirebaseFirestore.instance.collection('Name');
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return _buildListItem(context, snapshot.data.docs[index]);
                }
            );
          }
        },
      ),
    );
  }
}