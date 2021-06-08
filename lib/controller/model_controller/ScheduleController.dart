import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magane_money/model/Schedule.dart';

class ScheduleController {

  final CollectionReference scheduleCollection = FirebaseFirestore.instance.collection('Schedule');
  Future<void> insertSchedule(Schedule schedule) async {
    scheduleCollection.add(schedule.toMap());
  }

  Future<void> updateSchedule(Schedule schedule, int id) async {
    scheduleCollection.doc(id.toString()).update(schedule.toMap());
  }

  Future<void> deleteSchedule(String id) async {
    scheduleCollection.doc(id).delete();
  }
  
  //neu stateSchedule = false => schedule unfinished, stateSchedule = true => schedule finished
  Query getSchedule(bool stateSchedule) {
    Query querySchedule = scheduleCollection.where('stateSchedule', isEqualTo: stateSchedule);
    return querySchedule;
  }

  DocumentReference getScheduleById(String id) {
    return scheduleCollection.doc(id);
  }
}