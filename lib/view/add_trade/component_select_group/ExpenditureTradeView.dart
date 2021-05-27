import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/view/add_trade/component_select_group/component_expenditure_trade_view/Friends.dart';
import 'package:magane_money/view/add_trade/component_select_group/component_expenditure_trade_view/Shopping.dart';

import 'component_expenditure_trade_view/Gift.dart';
import 'component_expenditure_trade_view/Health.dart';
import 'component_expenditure_trade_view/Relax.dart';
import 'component_expenditure_trade_view/Vehicle.dart';
import 'component_expenditure_trade_view/EatFood.dart';

class ExpenditureTradeView extends StatelessWidget {
  List<Widget> items = [
    new EatFood(), new Friends(), new Gift(), new Health(), new Relax(),
    new Shopping(), new Vehicle(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            Map<String, String> data = {'name': 'Select Trade'};
            Navigator.pop(context, data);
          },
        ),
        title: Text('EXPENDITURE'),
      ),
      body: Column(
        children: <Widget> [
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return items[index];
                }
            ),
          )
        ],
      ),
    );
  }
}








