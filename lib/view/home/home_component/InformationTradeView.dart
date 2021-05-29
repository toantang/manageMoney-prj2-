import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magane_money/controller/viewController/InformationTradeController.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:get/get.dart';

class InformationTradeView extends StatelessWidget {

  String idTrade;
  InformationTradeView({Key key, @required this.idTrade}) : super(key : key);
  InformationTradeController informationTradeController = Get.put(InformationTradeController());

  void setData(DocumentSnapshot documentSnapshot) {
    for (int index = 0; index < listKey.length; index++) {
      var s = documentSnapshot[listKey[index]];
      String title = 'title';

      if (s.runtimeType == Timestamp){
        title = DateFormat('dd/MM/yyyy').format(DateTime.parse(s.toDate().toString()));
      }
      else {
        title = s.toString();
      }

      informationTradeController.valueUpdate[index] = title;
    }
  }

  void updateItem(BuildContext context, int index, String title) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Container(
            child: AlertDialog(
              title: Text(listUpdateItem[index]),
              content: new Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: informationTradeController.textEditingControllerUpdate,
                        keyboardType: (index == 2) ? TextInputType.number : TextInputType.text,
                      )
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      informationTradeController.getValueUpdate(index, title);
                    },
                    child: Text('YES', style: TextStyle(fontSize: 15),)
                )
              ],
            ),
          );
        }
    );
  }

  Widget inforTrade(BuildContext context, int index, DocumentSnapshot documentSnapshot) {
    String title = informationTradeController.valueUpdate[index];
    setData(documentSnapshot);

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Card(
        child: ListTile(
          leading: listIconInforTrade[index],
          title: Obx(() {
            return Text(informationTradeController.valueUpdate[index]);
          }),
          onTap: () {
            informationTradeController.textEditingControllerUpdate.clear();
            informationTradeController.textEditingControllerUpdate.text = informationTradeController.valueUpdate[index];
            if (index != 5) {
              updateItem(context, index, title);
              print('informationTradeController.valueUpdate[index] = ${informationTradeController.valueUpdate[index]}');
            }
          }
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> documentAnItem = FirebaseFirestore.instance.collection('Trade').doc(idTrade).snapshots();

    return StreamBuilder<DocumentSnapshot>(
      stream: documentAnItem,
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData || snapshot == null) {
          return Center(child: Text('Loading...'),);
        }
        else {
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Container(
                child: ListView.builder(
                    itemCount: listIconInforTrade.length,
                    itemBuilder: (context, index) {
                      return inforTrade(context, index, snapshot.data);
                    }
                ),
              )
          );
        }

      }
    );
  }
}