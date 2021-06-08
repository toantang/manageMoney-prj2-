import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magane_money/string/string_used.dart';

class ScheduleViewController extends GetxController {
  var _currentIndexTabbarScheduleView = 0.obs;

  void changeCurrentIndexTabbarScheduleView(int index) {
    this.currentIndexTabbarScheduleView = index;
  }

  get currentIndexTabbarScheduleView => _currentIndexTabbarScheduleView.value;

  set currentIndexTabbarScheduleView(value) {
    _currentIndexTabbarScheduleView.value = value;
  }
}