import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/color/color_used.dart';
import 'package:magane_money/other_things/other.dart';
import 'package:magane_money/view/add_trade/AddTrade.dart';

class AddButton extends StatelessWidget {

  //show view add transaction
  void showDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        double height = MediaQuery. of(context). size. height;
        print("height = $height");
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 450,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: AddTrade(),
            ),
            margin: EdgeInsets.only(top: kDefaultPadding*3.5, bottom: 50, left: 20, right: 20),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                    color: kDefaultLightGreen600,
                    width: 2.5
                )
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  Widget addButton(BuildContext context) {
    print('dong 48 add button class');
    return InkWell(
      onTap: () {
        showDialog(context);
      },
      child: Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
              gradient: kPrimaryGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ]
          ),
          child: Center(
            child: Icon(Icons.add, size: 60, color: kDefaultWhite,),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return addButton(context);
  }
}