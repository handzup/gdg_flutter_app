import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gdg_flutter_app/models/session/session.dart';

class SessionRepository {
  Future<List<Session>> getSessions() async {
    await Firebase.initializeApp();
    final document = FirebaseFirestore.instance.collection("sessions").get();
    var sessions = <Session>[];

    await document.then((value) => value.docs.forEach((element) {
          sessions
              .add(Session.fromJson(element.data(), int.tryParse(element.id)));
        }));
    return sessions;
  }
}
