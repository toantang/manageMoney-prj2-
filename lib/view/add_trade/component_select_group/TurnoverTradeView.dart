import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/string/string_used.dart';

class TurnoverTradeView extends StatelessWidget {

  void sendDataBack(BuildContext context, String nameTurnover) {
    Map<String, String> data = {'name': nameTurnover, 'nameGroupTrade': 'no group', 'frequency': '0'};
    Navigator.pop(context, data);
  }

  Widget makeTurnoverView(BuildContext context) {
    return Column(
      children: <Widget> [
        Expanded(
          child: ListView.builder(
              itemCount: listNameTurnover.length,
              itemBuilder: (context, index) {
                String nameTurnover = listNameTurnover[index];
                return Card(
                  child: ListTile(
                    title: Text(nameTurnover),
                    onTap: () {
                      sendDataBack(context, nameTurnover);
                    },
                  ),
                );
              }
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            sendDataBack(context, nameTrade);
          },
        ),
      ),
      body: Container(
        child: makeTurnoverView(context),
      ),
    );
  }
}