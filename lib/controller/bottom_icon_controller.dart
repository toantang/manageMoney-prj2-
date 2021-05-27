import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magane_money/color/color_used.dart';

class BottomIconController extends GetxController {

  var _currentIndexView = 0.obs;
  PageController _pageController;
  var listSignTap = [true, false, false, false].obs;

  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  void changeCurrentView(int index) {
    if(index != null) {
      _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease, );
    }
}

  void changeIsTapCurrent(int index) {
    listSignTap[index] = true;
    this._currentIndexView.value = index;

    for (int i = 0; i < index; i++) {
      listSignTap[i] = false;
    }
    for (int i = index + 1; i < 4; i++) {
      listSignTap[i] = false;
    }
  }

  Color colorCurrent(int index) {
    if (listSignTap[index] == false) {
      return kDefaultGrey400;
    }
    else {
      return Colors.green;
    }
  }

  PageController get pageController => _pageController;

  set pageController(PageController value) {
    _pageController = value;
  }

  get currentIndexView => _currentIndexView;

  set currentIndexView(value) {
    _currentIndexView = value;
  }
}