import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:magane_money/string/string_used.dart';

class InformationScheduleController extends GetxController {
  var _tapIndex = 0.obs;
  var _valueUpdate = ['nameSchedule', 'sumMoneySchedule', 'interval',
    'note', 'progessSchedule', 'dateStartSchedule'].obs;

  void setData(DocumentSnapshot documentSnapshot) {
    for (int index = 0; index < lisKeySchedule.length; index++) {
      var s = documentSnapshot[lisKeySchedule[index]];
      String title = 'title';

      if (s.runtimeType == Timestamp){
        title = DateFormat('dd/MM/yyyy').format(DateTime.parse(s.toDate().toString()));
      }
      else {
        title = s.toString();
      }

      this._valueUpdate[index] = title;
    }
  }

  get valueUpdate => _valueUpdate;

  set valueUpdate(value) {
    _valueUpdate = value;
  }

  get tapIndex => _tapIndex;

  set tapIndex(value) {
    _tapIndex = value;
  }
}