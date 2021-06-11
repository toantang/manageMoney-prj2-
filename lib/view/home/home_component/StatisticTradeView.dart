import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/controller/model_controller/TradeController.dart';
import 'package:magane_money/controller/viewController/HomeController.dart';
import 'package:magane_money/controller/viewController/trade_controller/StatisticController.dart';
import 'package:magane_money/string/string_used.dart';
import 'InformationTradeView.dart';
import 'package:get/get.dart';

class StatisticTradeView extends StatelessWidget {

  int idView = 0; //idView == 0 => gọi StatisticView in HomeView
  //idView == 1 => gọi StatisticView in Chart
  StatisticTradeView({Key key, @required this.idView}) : super(key: key);

  final HomeController homeController = Get.find();
  final TradeController tradeController = new TradeController();
  final StatisticController statisticController = new StatisticController();
  //show Item from database
  Widget showItem(BuildContext context, DocumentSnapshot documentSnapshot) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(documentSnapshot['nameTrade'], style: TextStyle(color: Colors.black87, fontSize: 16, ), ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text('${documentSnapshot['moneyTrade']} \$', style: TextStyle(color: Colors.red),),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever, color: Colors.black45, size: 25,),
          onPressed: () {

          },
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return InformationTradeView(idTrade : documentSnapshot.id);
            }
          ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() {
          Query queryTrade;
          if (idView == 0) {
            queryTrade = tradeController.getTradeByDateAndType(listTypeTrade[homeController.currentIndexTabbar],
                homeController.dateStart, homeController.dateEnd);
          }
          else if (idView == 1 || idView == 2) {
            statisticController.typeTradeid = false;
            queryTrade = statisticController.getData(idView, tradeController);
          }
          else {
            statisticController.typeTradeid = true;
            queryTrade = statisticController.getData(idView, tradeController);
          }

          if (queryTrade == null) {
            return Center(child: Text("no data"));
          }
          else {
            return StreamBuilder(
              stream: queryTrade.limit(11).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading...'),);
                }
                else {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return showItem(context, snapshot.data.docs[index]);
                      }
                  );
                }
              },
            );
          }
        })
      ],
    );
  }
}