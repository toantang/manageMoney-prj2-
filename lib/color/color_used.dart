import 'package:flutter/material.dart';
import 'package:magane_money/view/chart/component_chart/component_type_trade/PieChart.dart';

const Color kDefaultWhite = Colors.white;
const Color kDefaultBlack = Colors.black;
const Color kDefaultDeepPurple = Colors.deepPurple;
const Color kDefaultDeepPurpleAccent = Colors.deepPurpleAccent;
const Color kDefaultLightGreen600 = Color(0xff7cb342);
const Color kDefaultBlueAccent = Colors.blueAccent;
const Color kDefaultDeepOrange = Colors.deepOrange;
const Color kDefaultGrey400 = Color(0xffbdbdbd); // text color used in app
const Color kDefaultDeepPurpleAccent400 = Color(0xff651fff);
const kPrimaryGradient = LinearGradient(
  colors: [
    Color(0xFF46A0AE),
    Color(0xFF00FFCB)
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

//Color used in MakeChartView
const List<Color> listColorPieChart = [kDefaultDeepPurpleAccent, kDefaultLightGreen600, kDefaultBlueAccent, kDefaultDeepOrange];