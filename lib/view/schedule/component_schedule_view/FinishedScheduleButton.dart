import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishedScheduleButton extends StatelessWidget {

  Widget finishedScheduleButton(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {

        },
        child: Row(
          children: [
            Text('Planing doing', style: TextStyle(fontSize: 18),),
            Container(
              padding: EdgeInsets.only(left: 27.3),
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.black45;
                  }
                  else {
                    return Colors.lightBlueAccent;
                  }
                }
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return finishedScheduleButton(context);
  }
}