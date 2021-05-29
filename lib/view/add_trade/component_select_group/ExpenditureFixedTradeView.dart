import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/string/string_used.dart';

class ExpenditureFixedTradeView extends StatelessWidget {

  void sendDataBack(BuildContext context, String nameExpenditureFixed) {
    Map<String, String> data = {'name': nameExpenditureFixed, 'nameGroupTrade': 'no group', 'frequency': '0'};
    Navigator.pop(context, data);
  }

  Widget makeExpenditureFixedView(BuildContext context) {
    return Column(
      children: <Widget> [
        Expanded(
          child: ListView.builder(
              itemCount: listNameExpenditureFixed.length,
              itemBuilder: (context, index) {
                String nameExpenditureFixed = listNameExpenditureFixed[index];
                return Card(
                  child: ListTile(
                    title: Text(nameExpenditureFixed),
                    onTap: () {
                      sendDataBack(context, nameExpenditureFixed);
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
            sendDataBack(context, nameTradeDefault);
          },
        ),
      ),
      body: Container(
        child: makeExpenditureFixedView(context),
      ),
    );
  }
}