import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/string/string_used.dart';

class Introduce extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear, size: 30,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Welcome'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 10, right: 20),
            child: Text(introduce, style: TextStyle(
                fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}