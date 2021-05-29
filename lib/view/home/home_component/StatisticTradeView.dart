import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'InformationTradeView.dart';

class StatisticTradeView extends StatelessWidget {

  //show Item from database
  Widget showItem(BuildContext context, DocumentSnapshot documentSnapshot) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(documentSnapshot['nameTrade'], style: TextStyle(color: Colors.black87, fontSize: 16, ), ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text('${documentSnapshot['moneyTrade']} \$', style: TextStyle(color: Colors.red),),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever, color: Colors.black45, size: 25,),
          onPressed: () {

          },
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return InformationTradeView(idTrade : documentSnapshot.id);
            }
          ));
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    final documentCollectionTrade = FirebaseFirestore.instance.collection('Trade').limit(11).snapshots();

    return StreamBuilder(
      stream: documentCollectionTrade,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Text('Loading...'),);
        }
        else {
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return showItem(context, snapshot.data.docs[index]);
              }
          );
        }
      },
    );
  }
}