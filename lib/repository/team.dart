import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gdg_flutter_app/models/team/team.dart';

class TeamRepository {
  Future<List<Team>> getTeams() async {
    await Firebase.initializeApp();
    final document = FirebaseFirestore.instance.collection("team").get();
    var sessions = <Team>[];
    await document.then((value) => value.docs.forEach((element) {
          sessions.add(Team.fromJson(element.data()));
        }));
    return sessions;
  }
}
