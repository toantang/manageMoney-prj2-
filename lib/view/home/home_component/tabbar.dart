import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/main_view/background.dart';
import 'package:magane_money/other_things/other.dart';
import 'package:magane_money/string/string_used.dart';

import '../../../color/color_used.dart';

/// This is the stateless widget that the main application instantiates.
class MakeTabBar extends StatelessWidget {

  Widget tab(BuildContext context, String typeTransaction) {
    return Container(
      color: kDefaultWhite,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration:  BoxDecoration(
          /*image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(pathBackground),
          ),*/
          border: Border(
              top: BorderSide(
                style: BorderStyle.solid,
                width: 2.0,
                color: kDefaultGrey400,
              ),
              bottom: BorderSide(
                style: BorderStyle.solid,
                width: 1.0,
                color: kDefaultGrey400,
              ),
              right: BorderSide(
                style: BorderStyle.solid,
                width: 2,
                color: kDefaultGrey400,
              )
          ),
        ),
        child: Center(
            child: Padding(
                padding: EdgeInsets.only(left: kDefaultPaddingTabBar, right: kDefaultPaddingTabBar),
                child: Text(typeTransaction, style: TextStyle(
                  color: kDefaultBlack,
                ),
              )
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    int sizeTabBar = listTypeTrade.length;

    return DefaultTabController(
      initialIndex: 0,
      length: sizeTabBar,
      child: Stack(
        children: [
          TabBar(
            indicatorPadding: EdgeInsets.all(0.0),
            indicatorWeight: 2.0,
            labelPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            labelStyle: TextStyle(fontSize: kDefaultFontSize),
            indicator: ShapeDecoration(
              shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 10,
                    style: BorderStyle.solid,
                  )
              ),
              gradient: kPrimaryGradient,
            ),
            tabs: [
              tab(context, listTypeTrade[0]),
              tab(context, listTypeTrade[1]),
              tab(context, listTypeTrade[2]),
              tab(context, listTypeTrade[3]),
            ],
          )
        ],
      ),
    );
  }
}
