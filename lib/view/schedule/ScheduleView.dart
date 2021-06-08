import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/color/color_used.dart';
import 'file:///D:/Project%202/managemoney/lib/controller/viewController/schedule_controller/ScheduleViewController.dart';
import 'package:magane_money/main_view/background.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:magane_money/view/schedule/AddScheduleView.dart';
import 'package:magane_money/view/schedule/component_schedule_view/showListSchedule.dart';
import 'package:magane_money/view/schedule/component_schedule_view/tabbarScheduleView.dart';
import 'package:get/get.dart';

class ScheduleView extends StatelessWidget {

  final ScheduleViewController scheduleViewController = Get.put(ScheduleViewController());
  final List<Widget> listView = [ShowListSchedule(stateSchedule: false), ShowListSchedule(stateSchedule: true),];

  Widget tab(BuildContext context, String contentTab) {
    return Tab(
      text: contentTab,
    );
  }

  Widget addNewScheduleButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AddScheduleView();
                }
            ));
          },
          child: Text(textAddSchedule)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: scheduleViewController.currentIndexTabbarScheduleView,
        length: listContentTabScheduleView.length,
        child: Scaffold(
          body: Column(
            children: [
              TabBar(
                onTap: (int index) {
                },
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2.0,
                automaticIndicatorColorAdjustment: true,
                labelColor: kDefaultBlack,
                tabs: [
                  tab(context, listContentTabScheduleView[0]),
                  tab(context, listContentTabScheduleView[1]),
                ],
              ),
              addNewScheduleButton(context),
              Expanded(child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TabBarView(children: listView,),
              ),)
            ],
          ),
        )
    );
  }
}