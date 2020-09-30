import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gdg_flutter_app/models/speaker/speaker.dart';

class SpeakerRepository {
  List<Speaker> _speakers = List<Speaker>();
  List<Speaker> get speakers => _speakers;

  Future<List<Speaker>> getSpeakers() async {
    await Firebase.initializeApp();
    final document = FirebaseFirestore.instance.collection("speakers").get();
    var sessions = <Speaker>[];
    await document.then((value) => value.docs.forEach((element) {
          sessions.add(Speaker.fromJson(element.data(), element.id));
        }));
    _speakers = sessions;
    return sessions;
  }

  Future<Speaker> getSpeaker(String name) async {
    return _speakers.where((element) => element.queryPath == name).first;
    // await Firebase.initializeApp();
    // final document =
    //     FirebaseFirestore.instance.collection("speakers").doc(name).get();
    // return Speaker.fromJson(await document.then((value) => value.data(),));
  }
}
