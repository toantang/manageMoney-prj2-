import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magane_money/model/Schedule.dart';

class ScheduleController {

  final CollectionReference scheduleCollection = FirebaseFirestore.instance.collection('Schedule');
  Future<void> insertSchedule(Schedule schedule) {
    scheduleCollection.add(schedule.toMap());
  }

  Future<void> updateSchedule(Schedule schedule, int id) {
    scheduleCollection.doc(id.toString()).update(schedule.toMap());
  }

  Future<void> deleteSchedule(int id) {
    scheduleCollection.doc(id.toString()).delete();
  }
}