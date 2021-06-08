import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Project%202/managemoney/lib/controller/viewController/schedule_controller/AddScheduleController.dart';
import 'package:get/get.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:magane_money/view/schedule/component_add_schedule/InputIntervalSchedule.dart';
import 'package:magane_money/view/schedule/component_add_schedule/InputMoneySchedule.dart';
import 'package:magane_money/view/schedule/component_add_schedule/InputNameSchedule.dart';
import 'package:magane_money/view/schedule/component_add_schedule/SetDateStart.dart';
import 'component_add_schedule/InputNoteSchedule.dart';


class AddScheduleView extends StatelessWidget {

  final AddScheduleController addScheduleController = Get.put(AddScheduleController());
  Widget saveScheduleButton(BuildContext context) {
    return ElevatedButton(
      child: Text(save),
      onPressed: () {
        addScheduleController.getNameSchedule();
        addScheduleController.getMoney();
        addScheduleController.getIntervalSchedule();
        addScheduleController.getNoteSchedule();
        addScheduleController.checkAndInsertSchedule(context);
      },
    );
  }

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
        actions: [saveScheduleButton(context)],
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
      ),
    );
  }
}