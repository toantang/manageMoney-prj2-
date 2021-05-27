import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/string/string_used.dart';

class TurnoverFixedTradeView extends StatelessWidget {

  void sendDataBack(BuildContext context, String nameTurnoverFixed) {
    Map<String, String> data = {'name': nameTurnoverFixed, 'nameGroupTrade': 'no group', 'frequency': '0'};
    Navigator.pop(context, data);
  }

  Widget makeTurnoverFixedView(BuildContext context) {
    return Column(
      children: <Widget> [
        Expanded(
          child: ListView.builder(
              itemCount: listNameTurnoverFixed.length,
              itemBuilder: (context, index) {
                String nameTurnoverFixed = listNameTurnoverFixed[index];

                return Card(
                  child: ListTile(
                    title: Text(nameTurnoverFixed),
                    onTap: () {
                      sendDataBack(context, nameTurnoverFixed);
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
        child: makeTurnoverFixedView(context),
      ),
    );
  }
}