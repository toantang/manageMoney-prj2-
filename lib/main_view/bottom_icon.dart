import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/controller/bottom_icon_controller.dart';
import 'package:magane_money/other_things/other.dart';
import 'package:magane_money/view/chart/chart.dart';
import 'package:magane_money/view/home/home.dart';
import 'package:magane_money/view/settings//settings.dart';

import 'package:get/get.dart';

import 'add_button.dart';
class BottomIcon extends StatelessWidget {

  Widget customIcon(BuildContext context, Icon icon, double pad, BottomIconController c, int index) {
    return Padding(
      padding: EdgeInsets.only(left: pad),
      child: SizedBox(
        width: kDefaultWidthSizeBox,
        child: Center(
          child: Obx(() {
            return IconButton(
              icon: icon,
              iconSize: kDefaultIconSize*2,
              color: c.colorCurrent(index),
              onPressed: () {
                c.changeIsTapCurrent(index);
                c.changeCurrentView(index);
              },
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('don 37 class bottom icon' + MediaQuery.of(context).size.width.toString());
    final BottomIconController c = Get.put(BottomIconController());

    List<Widget> listWidget = [
      customIcon(context,Icon(Icons.home), 0, c, 0),
      customIcon(context,Icon(Icons.pie_chart), 0, c, 1),
      //customIcon(context,Icon(Icons.schedule), 180, c, 2),
      customIcon(context,Icon(Icons.schedule), 140, c, 2),
      customIcon(context,Icon(Icons.settings), 0, c, 3),
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Stack(
        children: [
          //padding chứa 4 icon
          Padding(
            padding: EdgeInsets.only(top: 230),
            child: Container(
              //color: Colors.purpleAccent,
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: Row(
                children: listWidget,
              ),
            ),
          ),

          //center chứa button thêm giao dịch
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 140),
              child: Container(
                //width: 180,
                width: 140, // độ rông của button thêm giao dịch
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: AddButton(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}