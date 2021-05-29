import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/main_view/background.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:magane_money/view/schedule/AddScheduleView.dart';
import 'package:magane_money/view/schedule/component_schedule_view/FinishedScheduleButton.dart';
import 'package:magane_money/view/schedule/component_schedule_view/UnfinishedScheduleButton.dart';

class Schedule extends StatelessWidget {

  Widget showListSchedule(BuildContext context) {
    return  Container(
      child: ListView.builder(
        itemCount: imagesScheduleView.length,
        itemBuilder: (context, index) {
          return Container(
            height: 80,
            padding: EdgeInsets.only(top: 5, left: 5, right: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight:Radius.circular(15)),
                color: Colors.cyan[400],
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {

                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(imagesScheduleView[index], fit: BoxFit.fill, ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      trailing: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        height: 50,
                        width: 7,
                        color: Colors.lime[300],
                      ),
                      leading: Text(listSub[index]),
                      onTap: () {

                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              UnfinishedScheduleButton(),
              FinishedScheduleButton(),
              Expanded(
                child: showListSchedule(context),
              )
            ],
          )
        ],
      ),
    );
  }
}