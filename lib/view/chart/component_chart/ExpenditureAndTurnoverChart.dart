import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magane_money/color/color_used.dart';
import 'package:magane_money/controller/model_controller/TradeController.dart';
import 'package:magane_money/controller/viewController/chart_controller/ExAndTurnoverController.dart';
import 'package:percent_indicator/percent_indicator.dart';
class ExpenditureAndTurnoverChart extends StatelessWidget {

  final ExAndTurnoverController exAndTurnoverController = Get.put(ExAndTurnoverController());
  final TradeController _tradeController = new TradeController();

  @override
  Widget build(BuildContext context) {
    //exAndTurnoverController.currentProgess.value = 80.0;
    return Scaffold(
      body: StreamBuilder(
        stream: this._tradeController.getAllTrade().snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text("Loading..."),);
          }
          else {
            exAndTurnoverController.countPercentExpenditure(snapshot.data);
            double percent = exAndTurnoverController.percentExpenditure;
            double percent100 = percent*100;
            print("percentEx = $percent , turnover = ${exAndTurnoverController.sumMoneyTurnover}");
            return Center(
              child: CircularPercentIndicator(
                reverse: true,
                linearGradient: kPrimaryGradient,
                lineWidth: 10.0,
                backgroundColor: kDefaultGrey400,
                animation: true,
                center: Text(percent100.toString(), style: TextStyle(fontSize: 20),),
                animationDuration: 1500,
                percent: percent,
                //progressColor: kDefaultLightGreen600,
                radius: 160,
              ),
            );
          }
        },
      )
    );
  }
}