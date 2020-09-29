import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gdg_flutter_app/models/schelude/schelude.dart';

class ScheduleRepository {
  Future<List<Schelude>> getSchedules() async {
    await Firebase.initializeApp();
    final document = FirebaseFirestore.instance.collection("schedule").get();
    var schedule = <Schelude>[];
    await document.then((value) => value.docs.forEach((element) {
          schedule.add(Schelude.fromJson(element.data()));
        }));
    return schedule;
  }
}
