import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/controller/bottom_icon_controller.dart';
import 'package:magane_money/main_view/accountBalance.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:magane_money/view/home/home.dart';
import 'package:magane_money/view/chart/chart.dart';
import 'package:magane_money/view/schedule/ScheduleView.dart';
import 'package:magane_money/view/settings//settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main_view/background.dart';
import 'main_view/bottom_icon.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      title: "test",
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePage();
  }
}
class _MyHomePage extends State<MyHomePage> {

  List<Widget> listView = [Home(), Chart(), Schedule(), Settings()];

  @override
  Widget build(BuildContext context) {
    Get.put(BottomIconController());
    final BottomIconController c = Get.find();
    print("dong 39 claas main");

    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Obx(() {
          return Text(listNameBottomNavigationBar[c.currentIndexView.value]);
        }),
      ),
      body: Stack(
        children: [
          //BackgroundMain(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AccountBalance(),
              Expanded(child: GetBuilder<BottomIconController>(
                builder: (context) {
                  return PageView(
                    controller: c.pageController,
                    onPageChanged: (int i) {
                      c.changeIsTapCurrent(i);
                    },
                    children: listView,
                  );
                },
              ),)
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BottomIcon(),
            ],
          )
        ],
      ),
    );
  }
}