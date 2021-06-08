import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:magane_money/color/color_used.dart';
import 'package:magane_money/controller/model_controller/TradeController.dart';
import 'package:magane_money/controller/viewController/chart_controller/PieChartController.dart';

class MakeChart extends StatelessWidget {
  final bool typeTradeId;
  final PieChartController pieChartController = new PieChartController();
  final TradeController _tradeController = new TradeController();

  MakeChart({Key key, this.typeTradeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Column(
        children: [
          Container(
            height: 300,
            child: Expanded(child: Card(
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
                                    if (desiredTouch && pieTouchResponse.touchedSection != null) {
                                      pieChartController.touchedIndex = pieTouchResponse.touchedSection.touchedSectionIndex;
                                    } else {
                                      pieChartController.touchedIndex = -1;
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: listColorPieChart[0]
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Text('xin chao test'),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Text('xin chao test'),
          )
        ],
      ),
    );
  }

  PieChartSectionData makePieChart(double value, double radius, double fontSize, int index) {
    return PieChartSectionData(
      color: listColorPieChart[index],
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
}
