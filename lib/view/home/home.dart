import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/main_view/background.dart';
import 'package:magane_money/view/home/home_component/set_date.dart';

import 'home_component/tabbar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //BackgroundMain(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MakeTabBar(),
              SetDate(),
            ],
          )
        ],
      ),
    );
  }
}