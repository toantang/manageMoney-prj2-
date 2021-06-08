import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Project%202/managemoney/lib/view/chart/component_chart/component_ex_turnover/CircleProgress.dart';

class CircleProgessState extends StatefulWidget {
  @override
  _CircleProgessState createState() {
    return _CircleProgessState();
  }

}

class _CircleProgessState extends State<CircleProgessState> with SingleTickerProviderStateMixin {
  AnimationController progessController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    progessController = AnimationController(vsync: this,
        duration: Duration(milliseconds: 2000));
    animation = Tween<double>(begin: 0, end: 80).animate(progessController)..addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('circle percent'),
      ),
      body: Center(
        child: CustomPaint(
          foregroundPainter: CircleProgress(animation.value),
          child: Container(
            width: 200,
            height: 200,
            child: GestureDetector(
              onTap: () {
                if (animation.value == 80) {
                  progessController.reverse();
                }
                else {
                  progessController.forward();
                }
              },
                child: Center(child: Text('100%'))
            ),
          ),
        ),
      ),
    );
  }
}