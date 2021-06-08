import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/controller/model_controller/ScheduleController.dart';
import 'file:///D:/Project%202/managemoney/lib/view/chart/component_chart/component_ex_turnover/CircleProgress.dart';

import 'InforScheduleView.dart';

class ShowListSchedule extends StatelessWidget {

  bool stateSchedule = false;
  ShowListSchedule({Key key, @required this.stateSchedule}) : super(key: key);

  final ScheduleController scheduleController = new ScheduleController();

  Widget showAnItem(BuildContext context, DocumentSnapshot documentSnapshot) {
    return Card(
      child: ListTile(
        title: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(documentSnapshot['nameSchedule'], style: TextStyle(color: Colors.black87, fontSize: 16, ), ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever, color: Colors.black45, size: 25,),
          onPressed: () {

          },
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return InformationScheduleView(idSchedule: documentSnapshot.id,);
              }
          ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Query query = scheduleController.getSchedule(stateSchedule);
    return StreamBuilder(
      stream: query.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text('no have schedule');
        }
        else {
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              return showAnItem(context, snapshot.data.docs[index]);
            }
          );
        }
      },
    );
  }
}