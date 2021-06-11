import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/controller/model_controller/TradeController.dart';
import 'package:magane_money/view/chart/component_chart/component_type_trade/PieChart.dart';
class TypeTradeView extends StatelessWidget {

  final bool typeTradeId; // ==false => Expenditure, ==true => Turnover
  TypeTradeView({Key key, @required this.typeTradeId}) : super(key: key);

  final TradeController _tradeController = new TradeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StreamBuilder(
                stream: this._tradeController.getTradeByType(typeTradeId).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading...'),);
                  }
                  else {
                    return MakeChart(typeTradeId: typeTradeId,);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}