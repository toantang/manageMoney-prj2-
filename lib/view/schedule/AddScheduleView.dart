import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/controller/viewController/AddScheduleController.dart';
import 'package:get/get.dart';
import 'package:magane_money/view/schedule/component_add_schedule/InputIntervalSchedule.dart';
import 'package:magane_money/view/schedule/component_add_schedule/InputMoneySchedule.dart';
import 'package:magane_money/view/schedule/component_add_schedule/InputNameSchedule.dart';
import 'package:magane_money/view/schedule/component_add_schedule/SetDateStart.dart';
import 'component_add_schedule/InputNoteSchedule.dart';


class AddScheduleView extends StatelessWidget {

  AddScheduleController addScheduleController = Get.put(AddScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              InputNameSchedule(),
              InputMoneySchedule(),
              InputIntervalSchedule(),
              SetDateStart(),
              InputNoteSchedule(),
            ],
          ),
        ],
      )
    );
  }
}