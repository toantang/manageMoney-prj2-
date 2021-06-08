import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/color/color_used.dart';
import 'file:///D:/Project%202/managemoney/lib/controller/viewController/schedule_controller/ScheduleViewController.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:get/get.dart';
import 'package:magane_money/view/schedule/component_schedule_view/showListSchedule.dart';

import '../AddScheduleView.dart';

class TabbarScheduleView extends StatelessWidget {

  ScheduleViewController scheduleViewController = Get.find();

  Widget tab(BuildContext context, String contentTab) {
    return Tab(
      text: contentTab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DefaultTabController(
          initialIndex: scheduleViewController.currentIndexTabbarScheduleView,
          length: listContentTabScheduleView.length,
          child: Stack(
            children: [
              TabBar(
                onTap: (int index) {
                  scheduleViewController.currentIndexTabbarScheduleView = index;
                },
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2.0,
                automaticIndicatorColorAdjustment: true,
                labelColor: kDefaultBlack,
                tabs: [
                  tab(context, listContentTabScheduleView[0]),
                  tab(context, listContentTabScheduleView[1]),
                  tab(context, listContentTabScheduleView[2]),
                ],
              ),
              Expanded(child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TabBarView(
                    children: [
                      ShowListSchedule(stateSchedule: false,),
                      ShowListSchedule(stateSchedule: true,),
                      AddScheduleView()
                    ]
                ),
              ),)
            ],
          )
      );
    });
  }
}