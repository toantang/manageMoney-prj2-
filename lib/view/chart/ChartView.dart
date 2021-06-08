import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/color/color_used.dart';
import 'package:magane_money/controller/viewController/chart_controller/ChartController.dart';
import 'package:magane_money/view/chart/component_chart/ExpenditureAndTurnoverChart.dart';
import 'package:magane_money/view/chart/component_chart/TypeTradeView.dart';

import 'package:magane_money/string/string_used.dart';
import 'package:get/get.dart';

class ChartView extends StatelessWidget {

  final ChartController chartController = Get.put(ChartController());
  final List<Widget> listView = [ExpenditureAndTurnoverChart(), TypeTradeView(typeTradeId: false), TypeTradeView(typeTradeId: true),];

  Widget tab(BuildContext context, String contentTab) {
    return Tab(
      text: contentTab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: chartController.currentIndexTabCharView,
        length: listContentTabChartView.length,
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TabBar(
                onTap: (int index) {
                  chartController.currentIndexTabCharView = index;
                },
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2.0,
                automaticIndicatorColorAdjustment: true,
                labelColor: kDefaultBlack,
                tabs: [
                  tab(context, listContentTabChartView[0]),
                  tab(context, listContentTabChartView[1]),
                  tab(context, listContentTabChartView[2]),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TabBarView(children: listView,),
                ),
              ),
            ],
          ),
        )
    );
  }
}