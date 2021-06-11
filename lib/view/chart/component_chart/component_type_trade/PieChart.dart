import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:magane_money/color/color_used.dart';
import 'package:magane_money/controller/model_controller/TradeController.dart';
import 'package:magane_money/controller/viewController/chart_controller/PieChartController.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:magane_money/view/home/home_component/StatisticTradeView.dart';

class MakeChart extends StatelessWidget {
  final bool typeTradeId;
  final PieChartController pieChartController = new PieChartController();
  final TradeController _tradeController = new TradeController();

  MakeChart({Key key, this.typeTradeId}) : super(key: key);

  Widget noteChartComponent(BuildContext context, int index) {
    Widget note = Padding(
      padding: EdgeInsets.only(left: 10, bottom: 10),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            color: listColorPieChart[index],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(listTypeTrade[index]),
          ),
        ],
      ),
    );
    return note;
  }

  Widget noteChart(BuildContext context) {
    if (typeTradeId == false) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          noteChartComponent(context, 0),
          noteChartComponent(context, 1),
        ],
      );
    }
    else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          noteChartComponent(context, 2),
          noteChartComponent(context, 3),
        ],
      );
    }
  }
  
  PieChartSectionData makePieChart(double value, double radius, double fontSize, int index) {
    return PieChartSectionData(
      color: typeTradeId==false? listColorPieChart[index] : listColorPieChart[index+2],
      value: value,
      title: value.toString(),
      radius: radius,
      titleStyle: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
      badgePositionPercentageOffset: .98,
    );;
  }

  List<PieChartSectionData> showingSections(List<DocumentSnapshot> documentSnapshotList) {
    pieChartController.getPercent(documentSnapshotList, typeTradeId);
    int len = pieChartController.listPercent.length;
    return List.generate(len, (i) {
      final isTouched = (i == pieChartController.touchedIndex);
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;

      return makePieChart(pieChartController.listPercent[i], radius, fontSize, i);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  height: 300,
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: StreamBuilder(
                            stream: this._tradeController.getTradeByType(typeTradeId).snapshots(),
                            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(child: Text('Loading...'),);
                              }
                              else {
                                return Obx(() {
                                  return PieChart(
                                    PieChartData(
                                        pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                                          final desiredTouch = pieTouchResponse.touchInput is! PointerExitEvent;
                                          int touched = pieTouchResponse.touchedSection.touchedSectionIndex;
                                          if (desiredTouch) {
                                            if (touched >= 0) {
                                              pieChartController.touchedIndex = touched;
                                            }
                                            else {
                                              pieChartController.touchedIndex = -5;
                                            }
                                          } else {
                                            pieChartController.touchedIndex = 9;
                                            print('touchedIndex = ${pieChartController.touchedIndex}');
                                          }

                                        }),
                                        borderData: FlBorderData(
                                          show: false,
                                        ),
                                        sectionsSpace: 0,
                                        centerSpaceRadius: 0,
                                        sections: showingSections(snapshot.data.docs)
                                    ),
                                  );
                                });
                              }
                            },
                          ),
                        ),
                        noteChart(context)
                      ],
                    ),
                  ),
                ),
              this.typeTradeId==false?
                  Obx(() {
                    return StatisticTradeView(idView: pieChartController.touchedIndex+1,);
                  })
                  :
                  Obx(() {
                    return StatisticTradeView(idView: pieChartController.touchedIndex+3,);
                  })

            ],
          ),
        ),
      ],
    );
  }
}