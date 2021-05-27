import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/string/string_used.dart';

class FeedBack extends StatelessWidget {

  Widget feedBack(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.clear, size: 30,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text('Feedback'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 15, left: 10, right: 15),
                child: Text(FEEDBACK, style: TextStyle(
                    fontSize: 20),),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: TextButton(
                  child: Text('https://www.facebook.com/profile/toantang', style: TextStyle(fontSize: 20),),
                ),
              )
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: feedBack(context),
    );
  }
}