import 'package:flutter/cupertino.dart';
import 'package:magane_money/string/string_used.dart';

class BackgroundMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(pathBackground, fit: BoxFit.fill,),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/background/bg_1.jpg', fit: BoxFit.fill,),
          ),
        ),
      ],
    );
  }
}