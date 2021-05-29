import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/main_view/background.dart';

class Chart extends StatelessWidget {
  
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('TypeTrade').doc('uoMNPMM1X2h9ENDG9cfK').collection('Trade');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder(
          stream: collectionReference.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
                return Text("Loading ");
              }
            else {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: Text(snapshot.data.docs[index]['name']),
                    );
                  }
              );
              }
            }
          )
        ],
      ),
    );
  }
}