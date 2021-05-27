import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/controller/bottom_icon_controller.dart';
import 'package:magane_money/main_view/bottom_icon.dart';
import 'package:get/get.dart';
import 'package:magane_money/other_things/other.dart';

class CustomIconBottom extends StatelessWidget {

  Icon icon;
  double pad;
  CustomIconBottom({Key key, this.icon, this.pad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomIconController c = Get.put(BottomIconController());

    return Padding(
      padding: EdgeInsets.only(left: pad),
      child: SizedBox(
        width: kDefaultWidthSizeBox,
        child: Obx(() => IconButton(
          icon: icon,
          iconSize: kDefaultIconSize*1.5,
          //color: c.colorCurrent(),
          onPressed: () {
            //c.changeIsTapCurrent();
          },
        ),
        ),
      ),
    );
  }
}