import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/controller/model_controller/ScheduleController.dart';
import 'file:///D:/Project%202/managemoney/lib/controller/viewController/schedule_controller/InformationScheduleController.dart';
import 'package:get/get.dart';
import 'package:magane_money/string/string_used.dart';

class InformationScheduleView extends StatelessWidget {
  final String idSchedule;
  InformationScheduleView({Key key, @required this.idSchedule}) : super(key: key);

  final InformationScheduleController informationScheduleController = Get.put(InformationScheduleController());
  final ScheduleController _scheduleController = new ScheduleController();

  Widget infoSchedule(BuildContext context, int index, DocumentSnapshot documentSnapshot) {
    informationScheduleController.setData(documentSnapshot);
    
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Card(
        child: ListTile(
          leading: Text(lisKeySchedule[index]),
          title: Obx(() {
            return Text(informationScheduleController.valueUpdate[index] + listUnitOneSchedule[index]);
          }),
          onTap: () {

          }
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<DocumentSnapshot>(
        stream: this._scheduleController.getScheduleById(this.idSchedule).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData || snapshot == null) {
            return Center(child: Text('Loading...'),);
          }
          else {
            return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_outlined),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: Container(
                  child: ListView.builder(
                      itemCount: listIconInforTrade.length,
                      itemBuilder: (context, index) {
                        return infoSchedule(context, index, snapshot.data);
                      }
                  ),
                )
            );
          }

        }
    );
  }
}