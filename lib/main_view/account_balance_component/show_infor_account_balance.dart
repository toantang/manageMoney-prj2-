import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/string/string_used.dart';

class ShowInforAccountBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
          itemCount: listTypeTrade.length,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: Text("no money"),
              leading: Text(listTypeTrade[index],),
            );
          }
      ),
    );
  }
}